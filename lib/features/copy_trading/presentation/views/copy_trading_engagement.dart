import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:roqqu_assessment/core/widgets/app_button.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/risk_profile_card.dart';

final selectedRiskProfileProvider = StateProvider<int?>((ref) => null);

class CopyTradingEngagementScreen extends ConsumerWidget {
  const CopyTradingEngagementScreen({super.key});

  final List<Map<String, String>> riskProfiles = const [
    {
      'title': 'Conservative profile',
      'description':
          'Conservative profile involves stable returns from proven strategies with minimal volatility.',
    },
    {
      'title': 'Steady growth profile',
      'description':
          'Steady growth involves balanced gains with moderate fluctuations in strategy performance.',
    },
    {
      'title': 'Exponential growth profile',
      'description':
          'It has potentials for significant gains or losses due to aggressive trading and market exposure.',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProfile = ref.watch(selectedRiskProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Copy trading',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What risk level are you comfortable exploring?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose a level',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: const Color(0xFFA7B1BC)),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: riskProfiles.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final profile = riskProfiles[index];
                    return RiskProfileCard(
                      title: profile['title']!,
                      description: profile['description']!,
                      isSelected: selectedProfile == index,
                      onTap: () {
                        ref.read(selectedRiskProfileProvider.notifier).state =
                            index;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              AppButton(label: 'Proceed', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
