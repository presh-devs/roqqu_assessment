import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trade_card.dart';

class AllTradesTab extends ConsumerWidget {
  const AllTradesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTrades = ref.watch(activeProTraderTradesProvider);
    final expiredTrades = ref.watch(expiredProTraderTradesProvider);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF20252B),
              border: Border.all(color: Color(0xFF262932)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1D23),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(color: const Color(0xFF262932)),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: const Color(0xFF353945),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: Colors.white,
                        unselectedLabelColor: const Color(0xFFA7B1BC),
                        labelStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs: const [
                          Tab(text: 'Current Trades'),
                          Tab(text: 'History'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2F36),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFF262932),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '7 days',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Transform.rotate(
                          angle: pi / 2,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFA7B1BC),
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: TabBarView(
              children: [
                activeTrades.isEmpty
                    ? const Center(
                        child: Text(
                          'No current trades',
                          style: TextStyle(
                            color: Color(0xFFA7B1BC),
                            fontSize: 14,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: activeTrades.length,
                        itemBuilder: (context, index) {
                          return ProTraderTradeCardWidget(trade: activeTrades[index]);
                        },
                      ),

                expiredTrades.isEmpty
                    ? const Center(
                        child: Text(
                          'No trade history',
                          style: TextStyle(
                            color: Color(0xFFA7B1BC),
                            fontSize: 14,
                          ),
                        ),
                      )
                    : ListView.builder(
                        
                        itemCount: expiredTrades.length,
                        itemBuilder: (context, index) {
                          return ProTraderTradeCardWidget(trade: expiredTrades[index], isActive: false);
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
