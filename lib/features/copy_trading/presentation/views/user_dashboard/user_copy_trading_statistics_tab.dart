import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/chart_header.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/statistics_card.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trading_pairs.dart';

class StatisticsTab extends ConsumerWidget {
  const StatisticsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(statisticsProvider);

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ChartHeader(title: 'Trading Statistics'),
                      ),
                      const SizedBox(height: 16),
                      StatisticsCardWidget(
                        label: 'PRO traders',
                        value: '${statistics.proTraders}',
                      ),
                      StatisticsCardWidget(
                        label: 'Trading days',
                        value: '${statistics.tradingDays}',
                      ),
                      StatisticsCardWidget(
                        label: 'Profit-share',
                        value: '${statistics.profitShare.toStringAsFixed(0)}%',
                      ),
                      StatisticsCardWidget(
                        label: 'Total orders',
                        value: '${statistics.totalOrders}',
                      ),
                      StatisticsCardWidget(
                        label: 'Average losses',
                        value:
                            '${statistics.averageLosses.toStringAsFixed(0)} USDT',
                        isRed: true,
                      ),
                      StatisticsCardWidget(
                        label: 'Total copy trades',
                        value: '${statistics.totalCopyTrades}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TradingPairs(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
