import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/home/presentation/providers/page_provider.dart';
import 'package:roqqu_assessment/features/home/presentation/views/home_page.dart';

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageProvider);
    final pages = [
      HomeScreen(),
      const Center(child: Text('Search Page')),
      const Center(child: Text('Profile Page')),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFF20252B),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ref.read(pageProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
