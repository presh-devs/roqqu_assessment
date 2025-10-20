import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/statistics.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader_model.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trader_card.dart';

class MyTradersScreen extends ConsumerWidget {
  const MyTradersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(statisticsProvider);
    final traders = ref.watch(filteredTradersProvider);

    return SafeArea(
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildStatsCards(statistics),
                  const SizedBox(height: 20),
                  _buildSearchBar(ref),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          const Expanded(
            child: Text(
              'My dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildStatsCards(StatisticsModel stats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Copy trading assets',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 8),
          Text(
            '\${stats.totalVolume.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Net profit',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\${stats.totalProfit.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Today's PNL",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          stats.todaysPnl >= 0
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: stats.todaysPnl >= 0
                              ? Colors.green
                              : Colors.red,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          stats.todaysPnl.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: stats.todaysPnl >= 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).state = value;
        },
        decoration: InputDecoration(
          hintText: 'Search for PRO traders',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF1E3A5F),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTradersList(List<TraderModel> traders) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ...traders.map((trader) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TraderCardWidget(trader: trader),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
