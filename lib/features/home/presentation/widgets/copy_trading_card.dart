import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'dart:math';

class CopyTradingCard extends StatelessWidget {
  const CopyTradingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/copyTrading'),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 112,
          padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(Assets.copyTradeBg1),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Copy Trading',
                      style: AppTheme.darkTheme.textTheme.titleMedium?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO!',
                      style: AppTheme.darkTheme.textTheme.bodySmall?.copyWith(color: Colors.black),
                    ),
                    Text(
                      'We are rooting for you!',
                      style: AppTheme.darkTheme.textTheme.bodySmall?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
