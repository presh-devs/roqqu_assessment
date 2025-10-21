import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader_model.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';

void main() {
  group('Copy Trading Providers Tests', () {
    test('searchQueryProvider should have empty initial value', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final query = container.read(searchQueryProvider);

      expect(query, '');
    });

    test('searchQueryProvider should update value', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(searchQueryProvider.notifier).state = 'Bitcoin';
      final query = container.read(searchQueryProvider);

      expect(query, 'Bitcoin');
    });

    test('tradersListProvider should have initial traders', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final traders = container.read(tradersListProvider);

      expect(traders.length, greaterThan(0));
      expect(traders.first, isA<TraderModel>());
    });

    test('filteredTradersProvider should filter by search query', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final allTraders = container.read(tradersListProvider);

      container.read(searchQueryProvider.notifier).state = 'jaykay';
      final filteredTraders = container.read(filteredTradersProvider);

      expect(filteredTraders.length, lessThanOrEqualTo(allTraders.length));
      expect(
        filteredTraders.every((t) => t.name.toLowerCase().contains('jaykay')),
        true,
      );
    });

    test('filteredTradersProvider should return all when query is empty', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(searchQueryProvider.notifier).state = '';
      final allTraders = container.read(tradersListProvider);
      final filteredTraders = container.read(filteredTradersProvider);

      expect(filteredTraders.length, allTraders.length);
    });

    test('TradersListNotifier should add trader', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(tradersListProvider.notifier);
      final initialCount = container.read(tradersListProvider).length;

      notifier.addTrader(
        TraderModel(
          id: '999',
          name: 'New Trader',
          avatar: 'NT',
          totalVolume: 1000.0,
          tradingProfit: 100.0,
        ),
      );
      final newCount = container.read(tradersListProvider).length;

      expect(newCount, initialCount + 1);
    });

    test('TradersListNotifier should remove trader', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(tradersListProvider.notifier);
      final traders = container.read(tradersListProvider);
      final traderToRemove = traders.first;

      notifier.removeTrader(traderToRemove.id);
      final updatedTraders = container.read(tradersListProvider);

      expect(updatedTraders.length, traders.length - 1);
      expect(updatedTraders.any((t) => t.id == traderToRemove.id), false);
    });

    test('statisticsProvider should calculate from trades', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final statistics = container.read(statisticsProvider);

      expect(statistics.totalTrades, isA<int>());
      expect(statistics.activeTrades, isA<int>());
      expect(statistics.totalVolume, isA<double>());
      expect(statistics.winRate, isA<double>());
    });
  });
}
