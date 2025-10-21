import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/copy_trading_dashboard_card.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/pro_trader_card.dart';

class CopyTradingDashboard extends ConsumerWidget {
  const CopyTradingDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Copy trading'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                CopyTradingDashboardCard(
                  title: 'My dashboard',
                  description: 'View trades',
                  assetPath: Assets.newDashboardIcon,
                  gradientColors: const [
                    Color(0xFFABE2F3),
                    Color(0xFFBDE4E5),
                    Color(0xFFEBE9D0),
                  ],
                  onTap: () => context.push('/user-copy-trading-dashboard'),
                ),
                const SizedBox(width: 16),
                CopyTradingDashboardCard(
                  assetPath: Assets.newBecomeTraderIcon,
                  title: 'Become a PRO trader',
                  description: 'Apply Now',
                  onTap: () {},
                  gradientColors: const [
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
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: proTraders.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return ProTraderCard(
                    trader: proTraders[index],
                    onTap: () => context.push(
                      '/trading-details',
                      extra: proTraders[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
