import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trading_history.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/user_p_n_l_chart.dart';

class UserCopyTradingChartTab extends StatelessWidget {
  const UserCopyTradingChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [UserPNLChart(), TradingHistory()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

