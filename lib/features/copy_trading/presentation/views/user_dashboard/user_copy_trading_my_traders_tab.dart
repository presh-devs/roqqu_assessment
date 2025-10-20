import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader_model.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/search_bar.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trader_card.dart';

class UserCopyTradingMyTradersTab extends ConsumerWidget {
  const UserCopyTradingMyTradersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final traders = ref.watch(filteredTradersProvider);

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const AppSearchBar(),
                  const SizedBox(height: 16),
                  _buildTradersList(traders),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTradersList(List<TraderModel> traders) {
    final borderColors = [
      const Color(0xFF5283FF),
      const Color(0xFFF79009),
      const Color(0xFF85D1F0),
    ];
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ...traders.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final trader = entry.value;
              final color = borderColors[index % borderColors.length];
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TraderCardWidget(
                  trader: trader,
                  borderColor: color,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
