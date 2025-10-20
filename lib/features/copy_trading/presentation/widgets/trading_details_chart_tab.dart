import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/asset_allocation_chart.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/pnl_chart.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/holding_period_chart.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/r_o_i_chart.dart';

class TradingDetailsChartTab extends StatelessWidget {
  const TradingDetailsChartTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ROIChart(),
        SizedBox(height: 4),
        PNLChart(),
        SizedBox(height: 4),
        AssetAllocationChart(),
        SizedBox(height: 4),
        HoldingPeriodChart(),
      ],
    );
  }
}
