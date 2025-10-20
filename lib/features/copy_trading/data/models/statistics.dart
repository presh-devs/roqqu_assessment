import 'package:roqqu_assessment/features/copy_trading/data/models/ticker_model.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trade_model.dart';

class StatisticsModel {
  final double totalVolume;
  final double totalProfit;
  final double todaysPnl;
  final int totalTrades;
  final int activeTrades;
  final double winRate;
  final int proTraders;
  final int tradingDays;
  final double profitShare;
  final int totalOrders;
  final double averageLosses;
  final int totalCopyTrades;

  StatisticsModel({
    required this.totalVolume,
    required this.totalProfit,
    required this.todaysPnl,
    required this.totalTrades,
    required this.activeTrades,
    required this.winRate,
    this.proTraders = 17,
    this.tradingDays = 43,
    this.profitShare = 15.0,
    this.totalOrders = 56,
    this.averageLosses = 0.0,
    this.totalCopyTrades = 72,
  });

  factory StatisticsModel.fromTrades(
    List<TradeModel> trades,
    Map<String, TickerModel> priceMap,
  ) {
    final activeTrades = trades.where((t) => t.isActive).length;
    final totalTrades = trades.length;
    
    double totalProfit = 0;
    double totalVolume = 0;
    double todaysPnl = 0;
    
    final today = DateTime.now();
    
    for (final trade in trades) {
      final profitLoss = (trade.currentPrice - trade.entryPrice) * trade.amount * trade.leverage;
      totalProfit += profitLoss;
      totalVolume += trade.amount;
      
      if (trade.entryTime.year == today.year &&
          trade.entryTime.month == today.month &&
          trade.entryTime.day == today.day) {
        todaysPnl += profitLoss;
      }
    }
    
    final winningTrades = trades.where((t) => t.roi > 0).length;
    final winRate = totalTrades > 0 ? (winningTrades / totalTrades) * 100 : 0.0;

    return StatisticsModel(
      totalVolume: totalVolume,
      totalProfit: totalProfit,
      todaysPnl: todaysPnl,
      totalTrades: totalTrades,
      activeTrades: activeTrades,
      winRate: winRate,
    );
  }

  StatisticsModel copyWith({
    double? totalVolume,
    double? totalProfit,
    double? todaysPnl,
    int? totalTrades,
    int? activeTrades,
    double? winRate,
    int? proTraders,
    int? tradingDays,
    double? profitShare,
    int? totalOrders,
    double? averageLosses,
    int? totalCopyTrades,
  }) {
    return StatisticsModel(
      totalVolume: totalVolume ?? this.totalVolume,
      totalProfit: totalProfit ?? this.totalProfit,
      todaysPnl: todaysPnl ?? this.todaysPnl,
      totalTrades: totalTrades ?? this.totalTrades,
      activeTrades: activeTrades ?? this.activeTrades,
      winRate: winRate ?? this.winRate,
      proTraders: proTraders ?? this.proTraders,
      tradingDays: tradingDays ?? this.tradingDays,
      profitShare: profitShare ?? this.profitShare,
      totalOrders: totalOrders ?? this.totalOrders,
      averageLosses: averageLosses ?? this.averageLosses,
      totalCopyTrades: totalCopyTrades ?? this.totalCopyTrades,
    );
  }
}
