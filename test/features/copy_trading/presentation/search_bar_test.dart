import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/search_bar.dart';

void main() {
  group('AppSearchBar Widget Tests', () {
    testWidgets('should display search hint text', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: AppSearchBar())),
        ),
      );

      expect(find.text('Search for PRO traders'), findsOneWidget);
    });

    testWidgets('should display search icon', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: AppSearchBar())),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should update provider when text changes', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: Scaffold(body: AppSearchBar())),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Bitcoin');
      await tester.pump();

      final query = container.read(searchQueryProvider);
      expect(query, 'Bitcoin');
    });

    testWidgets('should have correct styling', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: AppSearchBar())),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration;

      expect(decoration?.filled, true);
      expect(decoration?.fillColor, const Color(0xFF2A2F36));
    });
  });
}
