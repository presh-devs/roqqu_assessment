import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/features/history/presentation/views/history_page.dart';
import 'package:roqqu_assessment/features/home/presentation/providers/page_provider.dart';
import 'package:roqqu_assessment/features/home/presentation/views/home_page.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/more_for_you.dart';
import 'package:roqqu_assessment/features/profile/presentation/views/profile_page.dart';
import 'package:roqqu_assessment/features/wallet/presentation/views/wallet_page.dart';

class Main extends ConsumerWidget {
  const Main({super.key});

  void _showMoreDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return MoreForYou();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageProvider);
    final pages = [
      HomeScreen(),
      WalletPage(),
      HistoryPage(),
      
      ProfilePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(backgroundColor),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 2) {
            _showMoreDialog(context);
          } else {
            ref.read(pageProvider.notifier).state = index;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                SvgPicture.asset(Assets.home),
                Positioned(
                  right: 0,
                  top: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF79009),
                      shape: BoxShape.circle,
                    ),
                    width: 8,
                    height: 8,
                  ),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.fintechWallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.moreIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.transactions),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
