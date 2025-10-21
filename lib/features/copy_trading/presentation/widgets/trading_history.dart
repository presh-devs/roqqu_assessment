import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/chart_header.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/user_copy_trading_trade_card.dart';

class TradingHistory extends StatelessWidget {
  const TradingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(backgroundColor),
        border: Border.all(color: const Color(borderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: ChartHeader(title:  'Trading History'),
        ),
          const SizedBox(height: 16),
          UserCopyTradingTradeCard(),

          UserCopyTradingTradeCard(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
