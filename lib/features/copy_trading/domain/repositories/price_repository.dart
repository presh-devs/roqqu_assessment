import 'package:roqqu_assessment/features/copy_trading/data/models/ticker_model.dart';

abstract class PriceRepository {
  Stream<TickerModel> getPriceStream(List<String> symbols);
  void subscribeToSymbol(String symbol);
  void unsubscribeFromSymbol(String symbol);
  void dispose();
}
