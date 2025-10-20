import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_chart_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_my_traders_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_current_trades_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_statistics_tab.dart';

class UserCopyTradingDashboardPage extends StatefulWidget {
  const UserCopyTradingDashboardPage({super.key});

  @override
  State<UserCopyTradingDashboardPage> createState() => _UserCopyTradingDashboardPageState();
}

class _UserCopyTradingDashboardPageState extends State<UserCopyTradingDashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const UserCopyTradingChartTab(),
    const UserCopyTradingCurrentTradesTab(),
    const StatisticsScreen(),
    const UserCopyTradingMyTradersTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F2137),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem('Chart', 0),
                _buildNavItem('Current trades', 1),
                _buildNavItem('Stats', 2),
                _buildNavItem('My traders', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
