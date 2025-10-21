import 'package:roqqu_assessment/features/home/domain/repositories/price_repository.dart';

import '../datasources/binance_websocket_datasource.dart';
import '../models/ticker_model.dart';

class PriceRepositoryImpl implements PriceRepository {
  final BinanceWebSocketDataSource _dataSource;

  PriceRepositoryImpl(this._dataSource);

  @override
  Stream<TickerModel> getPriceStream(List<String> symbols) {
    _dataSource.connect(symbols);
    return _dataSource.tickerStream;
  }

  @override
  void subscribeToSymbol(String symbol) {
    _dataSource.subscribeToSymbol(symbol);
  }

  @override
  void unsubscribeFromSymbol(String symbol) {
    _dataSource.unsubscribeFromSymbol(symbol);
  }

  @override
  void dispose() {
    _dataSource.dispose();
  }
}