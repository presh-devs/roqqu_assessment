import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trade_card.dart';

class UserCopyTradingCurrentTradesTab extends ConsumerWidget {
  const UserCopyTradingCurrentTradesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trades = ref.watch(userTradeListProvider);

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ...trades.map((trade) => TradeCardWidget(trade: trade)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
