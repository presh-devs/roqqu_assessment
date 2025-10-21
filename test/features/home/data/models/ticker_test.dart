import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_assessment/features/home/data/models/ticker_model.dart';

void main() {
  group('TickerModel', () {
    test('should create TickerModel from JSON correctly', () {
      final json = {
        's': 'BTCUSDT',
        'c': '50000.00',
        'p': '1000.00',
        'P': '2.00',
        'v': '10000.00',
        'E': 1234567890000,
      };

      final ticker = TickerModel.fromJson(json);

      expect(ticker.symbol, 'BTCUSDT');
      expect(ticker.price, 50000.00);
      expect(ticker.priceChange, 1000.00);
      expect(ticker.priceChangePercent, 2.00);
      expect(ticker.volume, 10000.00);
      expect(
        ticker.timestamp,
        DateTime.fromMillisecondsSinceEpoch(1234567890000),
      );
    });

    test('should convert TickerModel to JSON correctly', () {
      final ticker = TickerModel(
        symbol: 'ETHUSDT',
        price: 3000.00,
        priceChange: 50.00,
        priceChangePercent: 1.67,
        volume: 5000.00,
        timestamp: DateTime.fromMillisecondsSinceEpoch(1234567890000),
      );

      final json = ticker.toJson();

      expect(json['s'], 'ETHUSDT');
      expect(json['c'], '3000.0');
      expect(json['p'], '50.0');
      expect(json['P'], '1.67');
      expect(json['v'], '5000.0');
      expect(json['E'], 1234567890000);
    });
  });
}
