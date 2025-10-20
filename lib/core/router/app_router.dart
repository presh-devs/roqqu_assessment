import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/features/copy_trading/domain/trader.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/confirm_transaction_screen.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading_dashboard.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading_engagement.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/enter_amount_screen.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/pin_confirmation_screen.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/success_screen.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/trading_details.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_dashboard_page.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/bottom_nav_bar.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/',

      routes: [
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
        GoRoute(
          path: '/copy-trading-dashboard',
          name: 'copyTradingDashboard',
          builder: (context, state) {
            return const CopyTradingDashboard();
          },
        ),
        GoRoute(
          path: '/trading-details',
          name: 'tradingDetails',
          builder: (context, state) {
            final ProTrader trader = state.extra as ProTrader;
            return TradingDetailsScreen(trader: trader);
          },
        ),
        GoRoute(
          path: '/enter-amount',
          name: 'enterAmount',
          builder: (context, state) {
            return const EnterAmountScreen();
          },
        ),
        GoRoute(
          path: '/trade-success',
          name: 'tradeSuccess',
          builder: (context, state) {
            return const SuccessScreen();
          },
        ),
        GoRoute(
          path: '/user-copy-trading-dashboard',
          name: 'userCopyTradingDashboard',
          builder: (context, state) {
            return const UserCopyTradingDashboardPage();
          },
        ),
        GoRoute(
          path: '/confirm-transaction',
          name: 'confirmTransaction',
          builder: (context, state) {
            final String amount = state.extra as String;
            return ConfirmTransactionScreen(amount: amount);
          },
        ),
        GoRoute(
          path: '/pin-confirmation',
          name: 'pinConfirmation',
          builder: (context, state) {
            return PinConfirmationScreen();
          },
        ),

        GoRoute(
          path: '/transaction-success',
          name: 'transactionSuccess',
          builder: (context, state) {
            return SuccessScreen();
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
                  const NoTransitionPage(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ],
    );
  }
}
