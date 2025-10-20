
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:roqqu_assessment/features/copy_trading/data/datasources/binance_websocket_datasource.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/copier_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/statistics.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/ticker_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trade_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/repositories/price_repository_impl.dart';
import 'package:roqqu_assessment/features/copy_trading/domain/repositories/price_repository.dart';

final binanceWebSocketDataSourceProvider = Provider<BinanceWebSocketDataSource>(
  (ref) {
    final dataSource = BinanceWebSocketDataSource();
    ref.onDispose(() => dataSource.dispose());
    return dataSource;
  },
);

final priceRepositoryProvider = Provider<PriceRepository>((ref) {
  final dataSource = ref.watch(binanceWebSocketDataSourceProvider);
  return PriceRepositoryImpl(dataSource);
});

final watchedSymbolsProvider = StateProvider<List<String>>((ref) {
  return ['BTCUSDT', 'ETHUSDT', 'XRPUSDT', 'DOGEUSDT', 'TIAUSDT', 'PERPUSDT'];
});

final priceStreamProvider = StreamProvider.autoDispose<TickerModel>((ref) {
  final repository = ref.watch(priceRepositoryProvider);
  final symbols = ref.watch(watchedSymbolsProvider);

  return repository.getPriceStream(symbols);
});

final priceMapProvider =
    StateNotifierProvider<PriceMapNotifier, Map<String, TickerModel>>((ref) {
      return PriceMapNotifier(ref);
    });

class PriceMapNotifier extends StateNotifier<Map<String, TickerModel>> {
  final Ref _ref;

  PriceMapNotifier(this._ref) : super({}) {
    _listenToPriceStream();
  }

  void _listenToPriceStream() {
    _ref.listen<AsyncValue<TickerModel>>(priceStreamProvider, (previous, next) {
      next.whenData((ticker) {
        state = {...state, ticker.symbol: ticker};
      });
    });
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

final userTradeListProvider =
    StateNotifierProvider<TradeListNotifier, List<TradeModel>>((ref) {
      return TradeListNotifier(ref);
    });

final activeProTraderTradesProvider = Provider<List<TradeModel>>((ref) {
  return [
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
      copiers: 20,
      copiersAmount: 1009.772,
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
      copiers: 20,
      copiersAmount: 1009.772,
    ),
    TradeModel(
      id: '3',
      symbol: 'BTCUSDT',
      traderName: 'BTC master',
      entryPrice: 1.9661,
      currentPrice: 1.9728,
      roi: 3.28,
      leverage: 10,
      entryTime: DateTime.now().subtract(const Duration(hours: 1)),
      isActive: true,
      amount: 1009.772,
      copiers: 20,
      copiersAmount: 1009.772,
    ),
  ];
});

final expiredProTraderTradesProvider = Provider<List<TradeModel>>((ref) {
  return [
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
      copiers: 20,
      copiersAmount: 1009.772,
      exitTime: DateTime.now().subtract(const Duration(hours: 1)),
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
      copiers: 20,
      copiersAmount: 1009.772,
      exitTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    TradeModel(
      id: '3',
      symbol: 'BTCUSDT',
      traderName: 'BTC master',
      entryPrice: 1.9661,
      currentPrice: 1.9728,
      roi: 3.28,
      leverage: 10,
      entryTime: DateTime.now().subtract(const Duration(hours: 1)),
      isActive: true,
      amount: 1009.772,
      copiers: 20,
      copiersAmount: 1009.772,
      exitTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];
});

class TradeListNotifier extends StateNotifier<List<TradeModel>> {
  final Ref _ref;

  TradeListNotifier(this._ref)
    : super([
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
      ]);
}

final statisticsProvider = Provider<StatisticsModel>((ref) {
  final trades = ref.watch(userTradeListProvider);
  final priceMap = ref.watch(priceMapProvider);

  return StatisticsModel.fromTrades(trades, priceMap);
});

final tradersListProvider =
    StateNotifierProvider<TradersListNotifier, List<TraderModel>>((ref) {
      return TradersListNotifier();
    });

class TradersListNotifier extends StateNotifier<List<TraderModel>> {
  TradersListNotifier()
    : super([
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
          name: 'Okobi Laura',
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




final searchQueryProvider = StateProvider<String>((ref) => '');

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


final copierListProvider =
    StateNotifierProvider<CopiersListNotifier, List<CopierModel>>((ref) {
      return CopiersListNotifier();
    });

class CopiersListNotifier extends StateNotifier<List<CopierModel>> {
  CopiersListNotifier()
    : super([
        CopierModel (
          id: '1',
          name: 'Jaykay Kayode',
          avatar: 'JK',
          totalVolume: 996.28,
          tradingProfit: 278.2,
          isVerified: true,
        ),
        CopierModel(
          id: '2',
          name: 'Okobi Laura',
          avatar: 'OL',
          totalVolume: 996.28,
          tradingProfit: 278.81,
          isVerified: true,
        ),
        CopierModel(
          id: '3',
          name: 'Tosin Laslsi',
          avatar: 'TL',
          totalVolume: 996.28,
          tradingProfit: 278.81,
          isVerified: true,
        ),
        CopierModel(
          id: '4',
          name: 'Victor Chukwu',
          avatar: 'TL',
          totalVolume: 996.28,
          tradingProfit: 278.81,
          isVerified: true,
        ),
        CopierModel(
          id: '5',
          name: 'Onwuamoke Ebere',
          avatar: 'TL',
          totalVolume: 996.28,
          tradingProfit: 278.81,
          isVerified: true,
        ),
        CopierModel(
          id: '6',
          name: 'Omotola Bello',
          avatar: 'TL',
          totalVolume: 996.28,
          tradingProfit: 278.81,
          isVerified: true,
        ),
      ]);

  void addTrader(CopierModel copier) {
    state = [...state, copier];
  }

  void removeTrader(String copierId) {
    state = state.where((copier) => copier.id != copierId).toList();
  }

  void updateTrader(String copierId, CopierModel updatedCopier) {
    state = state.map((copier) {
      if (copier.id == copierId) {
        return updatedCopier;
      }
      return copier;
    }).toList();
  }
}




final copierSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredCopiersProvider = Provider<List<CopierModel>>((ref) {
  final copiers = ref.watch(copierListProvider);
  final query = ref.watch(copierSearchQueryProvider).toLowerCase();

  if (query.isEmpty) {
    return copiers;
  }

  return copiers.where((copier) {
    return copier.name.toLowerCase().contains(query);
  }).toList();
});