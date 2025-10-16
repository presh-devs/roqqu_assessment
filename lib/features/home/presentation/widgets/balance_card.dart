import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                'Your GBP Balance',
                style: AppTheme.darkTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
              SvgPicture.asset(Assets.uEye),
            ],
          ),
          const SizedBox(height: 8),
           RichText(
            text: TextSpan(
              text: '£0',
              style: TextStyle(
                fontFamily: 'Encode Sans',
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: '.00',
                  style: TextStyle(
                    fontFamily: 'Encode Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
           
          ),
        ],
      ),
    );
  }
}
