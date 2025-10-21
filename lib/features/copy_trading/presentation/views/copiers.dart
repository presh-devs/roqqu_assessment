import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/copier_model.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/copier_card.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/search_bar.dart';

class CopiersTab extends ConsumerWidget {
  const CopiersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copiers = ref.watch(filteredCopiersProvider);

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(color: const Color(backgroundColor)),
                    child: const AppSearchBar(),
                  ),
                  _buildCopiersList(copiers),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopiersList(List<CopierModel> copiers) {
    final borderColors = [
      const Color(0xFF5283FF),
      const Color(0xFFF79009),
      const Color(0xFF85D1F0),
      const Color(0xFF17B26A),
      const Color(0xFF5283FF),
      const Color(0xFF5283FF),
    ];

    return Column(
      children: [
        ...copiers.asMap().entries.map((entry) {
          final index = entry.key;
          final copier = entry.value;
          final color = borderColors[index % borderColors.length];

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: CopierCard(copier: copier, borderColor: color),
          );
        }),
        const SizedBox(height: 20),
      ],
    );
  }
}
