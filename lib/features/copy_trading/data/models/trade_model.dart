class TradeModel {
  final String id;
  final String symbol;
  final String traderName;
  final double entryPrice;
  final double currentPrice;
  final double roi;
  final int leverage;
  final DateTime entryTime;
  final bool isActive;
  final double amount;
  final int? copiers;
  final double? copiersAmount;
  final DateTime? exitTime;

  TradeModel({
    required this.id,
    required this.symbol,
    required this.traderName,
    required this.entryPrice,
    required this.currentPrice,
    required this.roi,
    required this.leverage,
    required this.entryTime,
    required this.isActive,
    required this.amount,
    this.copiers,
    this.copiersAmount,
    this.exitTime,
  });

  TradeModel copyWith({
    String? id,
    String? symbol,
    String? traderName,
    double? entryPrice,
    double? currentPrice,
    double? roi,
    int? leverage,
    DateTime? entryTime,
    bool? isActive,
    double? amount,
  }) {
    return TradeModel(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      traderName: traderName ?? this.traderName,
      entryPrice: entryPrice ?? this.entryPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      roi: roi ?? this.roi,
      leverage: leverage ?? this.leverage,
      entryTime: entryTime ?? this.entryTime,
      isActive: isActive ?? this.isActive,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'traderName': traderName,
      'entryPrice': entryPrice,
      'currentPrice': currentPrice,
      'roi': roi,
      'leverage': leverage,
      'entryTime': entryTime.toIso8601String(),
      'isActive': isActive,
      'amount': amount,
    };
  }

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      traderName: json['traderName'] as String,
      entryPrice: json['entryPrice'] as double,
      currentPrice: json['currentPrice'] as double,
      roi: json['roi'] as double,
      leverage: json['leverage'] as int,
      entryTime: DateTime.parse(json['entryTime'] as String),
      isActive: json['isActive'] as bool,
      amount: json['amount'] as double,
    );
  }
}