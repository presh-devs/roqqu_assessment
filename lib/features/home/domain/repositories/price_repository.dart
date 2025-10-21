import 'package:roqqu_assessment/features/home/data/models/ticker_model.dart';

abstract class PriceRepository {
  Stream<TickerModel> getPriceStream(List<String> symbols);
  void subscribeToSymbol(String symbol);
  void unsubscribeFromSymbol(String symbol);
  void dispose();
}
