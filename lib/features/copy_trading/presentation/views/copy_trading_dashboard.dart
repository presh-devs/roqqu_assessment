import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/features/copy_trading/domain/trader.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/copy_trading_dashboard_card.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/pro_trader_card.dart';




class CopyTradingDashboard extends ConsumerWidget {
  const CopyTradingDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProTrader> proTraders = [
      const ProTrader(
        name: 'Jay isisou',
        initials: 'JI',
        followers: 500,
        roi: '+120.42%',
        totalPnl: '\$38,667.29',
        winRate: '100%',
        aum: '38,667.29',
        chartData: [0.5, 0.6, 0.4, 0.8, 0.7, 0.9, 0.6, 0.8, 0.5],
      ),
      const ProTrader(
        name: 'Laura okobi',
        initials: 'LO',
        followers: 500,
        roi: '+120.42%',
        totalPnl: '\$38,667.29',
        winRate: '100%',
        aum: '38,667.29',
        chartData: [0.5, 0.6, 0.4, 0.8, 0.7, 0.9, 0.6, 0.8, 0.5],
      ),
      const ProTrader(
        name: 'BTC master',
        initials: 'BM',
        followers: 500,
        roi: '+120.42%',
        totalPnl: '\$38,667.29',
        winRate: '100%',
        aum: '38,667.29',
        chartData: [0.5, 0.6, 0.4, 0.8, 0.7, 0.9, 0.6, 0.8, 0.5],
      ),
    ];

 

    return Scaffold(
      appBar: AppBar(
        title: Text('Copy trading', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Row(
              children: [
                CopyTradingDashboardCard(
                  title: 'My dashboard',
                  description: 'View trades',
                  gradientColors: [
                    Color(0xFFABE2F3),
                    Color(0xFFBDE4E5),
                    Color(0xFFEBE9D0),
                  ],
                ),
                SizedBox(width: 16),
                CopyTradingDashboardCard(
                  title: 'Become a PRO trader',
                  description: 'Apply Now',
                  gradientColors: [
                    Color(0xFFC0CFFE),
                    Color(0xFFF3DFF4),
                    Color(0xFFF9D8E5),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'PRO Traders',
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: proTraders.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return ProTraderCard(trader: proTraders[index], onTap: () => context.push('/trading-details'),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
