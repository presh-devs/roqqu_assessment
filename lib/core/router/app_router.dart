import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading_engagement.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/bottom_nav_bar.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/',

      routes: [
        // GoRoute(
        //   path: '/verify',
        //   name: 'verify',
        //   builder: (context, state) => const SimpleVerificationPage(),
        // ),
        GoRoute(
          path: '/copyTrading',
          name: 'copyTrading',
          builder: (context, state) {
            return const CopyTradingScreen();
          },
        ),
        GoRoute(
          path: '/copy-trading-engagement',
          name: 'copyTradingEngagement',
          builder: (context, state) {
            return const CopyTradingEngagementScreen();
          },
        ),

        // Protected routes
        ShellRoute(
          builder: (context, state, child) => Main(),
          routes: [
            GoRoute(
              path: '/',
              name: 'main',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SizedBox()),
            ),
          ],
        ),
      ],
    );
  }
}
