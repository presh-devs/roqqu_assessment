class TickerModel {
  final String symbol;
  final double price;
  final double priceChange;
  final double priceChangePercent;
  final double volume;
  final DateTime timestamp;

  TickerModel({
    required this.symbol,
    required this.price,
    required this.priceChange,
    required this.priceChangePercent,
    required this.volume,
    required this.timestamp,
  });

  factory TickerModel.fromJson(Map<String, dynamic> json) {
    return TickerModel(
      symbol: json['s'] as String,
      price: double.parse(json['c'] as String),
      priceChange: double.parse(json['p'] as String),
      priceChangePercent: double.parse(json['P'] as String),
      volume: double.parse(json['v'] as String),
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['E'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      's': symbol,
      'c': price.toString(),
      'p': priceChange.toString(),
      'P': priceChangePercent.toString(),
      'v': volume.toString(),
      'E': timestamp.millisecondsSinceEpoch,
    };
  }
}
