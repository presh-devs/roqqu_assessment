// DataSource Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:roqqu_assessment/features/copy_trading/data/datasources/binance_websocket_datasource.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/statistics.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/ticker_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trade_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/repositories/price_repository_impl.dart';
import 'package:roqqu_assessment/features/copy_trading/domain/repositories/price_repository.dart';

final binanceWebSocketDataSourceProvider = Provider<BinanceWebSocketDataSource>((ref) {
  final dataSource = BinanceWebSocketDataSource();
  ref.onDispose(() => dataSource.dispose());
  return dataSource;
});

// Repository Provider
final priceRepositoryProvider = Provider<PriceRepository>((ref) {
  final dataSource = ref.watch(binanceWebSocketDataSourceProvider);
  return PriceRepositoryImpl(dataSource);
});

// State Provider for watched symbols
final watchedSymbolsProvider = StateProvider<List<String>>((ref) {
  return ['BTCUSDT', 'ETHUSDT', 'XRPUSDT', 'DOGEUSDT', 'TIAUSDT', 'PERPUSDT'];
});

// Price Stream Provider
final priceStreamProvider = StreamProvider.autoDispose<TickerModel>((ref) {
  final repository = ref.watch(priceRepositoryProvider);
  final symbols = ref.watch(watchedSymbolsProvider);
  
  return repository.getPriceStream(symbols);
});

// Price Map Provider - maintains latest prices for all symbols
final priceMapProvider = StateNotifierProvider<PriceMapNotifier, Map<String, TickerModel>>((ref) {
  return PriceMapNotifier(ref);
});

class PriceMapNotifier extends StateNotifier<Map<String, TickerModel>> {
  final Ref _ref;
  
  PriceMapNotifier(this._ref) : super({}) {
    _listenToPriceStream();
  }

  void _listenToPriceStream() {
    _ref.listen<AsyncValue<TickerModel>>(
      priceStreamProvider,
      (previous, next) {
        next.whenData((ticker) {
          state = {
            ...state,
            ticker.symbol: ticker,
          };
        });
      },
    );
  }

  TickerModel? getPriceForSymbol(String symbol) {
    return state[symbol];
  }

  void addSymbol(String symbol) {
    final repository = _ref.read(priceRepositoryProvider);
    repository.subscribeToSymbol(symbol);
  }

  void removeSymbol(String symbol) {
    final repository = _ref.read(priceRepositoryProvider);
    repository.unsubscribeFromSymbol(symbol);
    state = Map.from(state)..remove(symbol);
  }
}

// Trade List Provider with live price updates
final tradeListProvider = StateNotifierProvider<TradeListNotifier, List<TradeModel>>((ref) {
  return TradeListNotifier(ref);
});

class TradeListNotifier extends StateNotifier<List<TradeModel>> {
  final Ref _ref;

  TradeListNotifier(this._ref) : super([
    TradeModel(
      id: '1',
      symbol: 'BTCUSDT',
      traderName: 'BTC master',
      entryPrice: 1.9661,
      currentPrice: 1.9728,
      roi: 3.28,
      leverage: 10,
      entryTime: DateTime.now().subtract(const Duration(hours: 2)),
      isActive: true,
      amount: 1009.772,
    ),
    TradeModel(
      id: '2',
      symbol: 'BTCUSDT',
      traderName: 'BTC master',
      entryPrice: 1.9661,
      currentPrice: 1.9728,
      roi: 3.28,
      leverage: 10,
      entryTime: DateTime.now().subtract(const Duration(hours: 1)),
      isActive: true,
      amount: 1009.772,
    ),
  ]) {
    _listenToPriceUpdates();
  }

  void _listenToPriceUpdates() {
    _ref.listen<Map<String, TickerModel>>(
      priceMapProvider,
      (previous, next) {
        _updateTradesWithLatestPrices(next);
      },
    );
  }

  void _updateTradesWithLatestPrices(Map<String, TickerModel> priceMap) {
    state = state.map((trade) {
      final ticker = priceMap[trade.symbol];
      if (ticker != null && trade.isActive) {
        final currentPrice = ticker.price;
        final roi = ((currentPrice - trade.entryPrice) / trade.entryPrice) * 100 * trade.leverage;
        
        return trade.copyWith(
          currentPrice: currentPrice,
          roi: roi,
        );
      }
      return trade;
    }).toList();
  }

  void addTrade(TradeModel trade) {
    state = [...state, trade];
  }

  void removeTrade(String tradeId) {
    state = state.where((trade) => trade.id != tradeId).toList();
  }

  void closeTrade(String tradeId) {
    state = state.map((trade) {
      if (trade.id == tradeId) {
        return trade.copyWith(isActive: false);
      }
      return trade;
    }).toList();
  }

  void updateTrade(String tradeId, TradeModel updatedTrade) {
    state = state.map((trade) {
      if (trade.id == tradeId) {
        return updatedTrade;
      }
      return trade;
    }).toList();
  }
}

// Statistics Provider
final statisticsProvider = Provider<StatisticsModel>((ref) {
  final trades = ref.watch(tradeListProvider);
  final priceMap = ref.watch(priceMapProvider);
  
  return StatisticsModel.fromTrades(trades, priceMap);
});

// Traders List Provider
final tradersListProvider = StateNotifierProvider<TradersListNotifier, List<TraderModel>>((ref) {
  return TradersListNotifier();
});

class TradersListNotifier extends StateNotifier<List<TraderModel>> {
  TradersListNotifier() : super([
    TraderModel(
      id: '1',
      name: 'Jaykay Kayode',
      avatar: 'JK',
      totalVolume: 996.28,
      tradingProfit: 278.2,
      isVerified: true,
    ),
    TraderModel(
      id: '2',
      name: 'Okoh Laura',
      avatar: 'OL',
      totalVolume: 996.28,
      tradingProfit: 278.81,
      isVerified: true,
    ),
    TraderModel(
      id: '3',
      name: 'Tosin Laslsi',
      avatar: 'TL',
      totalVolume: 996.28,
      tradingProfit: 278.81,
      isVerified: true,
    ),
  ]);

  void addTrader(TraderModel trader) {
    state = [...state, trader];
  }

  void removeTrader(String traderId) {
    state = state.where((trader) => trader.id != traderId).toList();
  }

  void updateTrader(String traderId, TraderModel updatedTrader) {
    state = state.map((trader) {
      if (trader.id == traderId) {
        return updatedTrader;
      }
      return trader;
    }).toList();
  }
}

// Search Query Provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Filtered Traders Provider
final filteredTradersProvider = Provider<List<TraderModel>>((ref) {
  final traders = ref.watch(tradersListProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();
  
  if (query.isEmpty) {
    return traders;
  }
  
  return traders.where((trader) {
    return trader.name.toLowerCase().contains(query);
  }).toList();
});