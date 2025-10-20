class CopierModel {
  final String id;
  final String name;
  final String avatar;
  final double totalVolume;
  final double tradingProfit;
  final bool isVerified;
  final int followers;
  

  CopierModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.totalVolume,
    required this.tradingProfit,
    this.isVerified = true,
    this.followers = 0,
  });

  CopierModel copyWith({
    String? id,
    String? name,
    String? avatar,
    double? totalVolume,
    double? tradingProfit,
    bool? isVerified,
    int? followers,
  }) {
    return CopierModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      totalVolume: totalVolume ?? this.totalVolume,
      tradingProfit: tradingProfit ?? this.tradingProfit,
      isVerified: isVerified ?? this.isVerified,
      followers: followers ?? this.followers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'totalVolume': totalVolume,
      'tradingProfit': tradingProfit,
      'isVerified': isVerified,
      'followers': followers,
    };
  }

  factory CopierModel.fromJson(Map<String, dynamic> json) {
    return CopierModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      totalVolume: json['totalVolume'] as double,
      tradingProfit: json['tradingProfit'] as double,
      isVerified: json['isVerified'] as bool? ?? true,
      followers: json['followers'] as int? ?? 0,
    );
  }
}