import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/balance_card.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/copy_trading_card.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/home_action_card.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/home_app_bar.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/listed_coins_section.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/stay_updated_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC0CFFE), Color(0xFFF3DFF4), Color(0xFFF9D8E5)],
              begin: Alignment(-0.95, -0.32),
              end: Alignment(0.95, 0.32),
              stops: [0.0042, 0.5774, 0.9862],
            ),
          ),
          child: Column(
            children: [
              HomeAppBar(),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1C2127),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BalanceCard(),
                      HomeActionCard(),
                      CopyTradingCard(),
                      StayUpdatedSection(),
                      ListedCoinsSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
