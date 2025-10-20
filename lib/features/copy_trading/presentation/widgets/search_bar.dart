import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';

class AppSearchBar extends ConsumerWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).state = value;
        },
        decoration: InputDecoration(
          hintText: 'Search for PRO traders',
          hintStyle: const TextStyle(color: Color(0xFFA7B1BC)),
          suffixIcon: const Icon(Icons.search, color: Color(0xFFA7B1BC)),
          filled: true,
          fillColor: const Color(0xFF2A2F36),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF262932), width: 1),
          ),
        ),
      ),
    );
  }
}
