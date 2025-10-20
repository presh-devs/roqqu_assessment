import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';

class CopyTradingDashboardCard extends StatelessWidget {
  const CopyTradingDashboardCard({super.key, 
    required this.gradientColors,
    required this.title,
    required this.description, required this.onTap,
  });

  final List<Color> gradientColors;
  final String title, description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x33000000), 
                ),
                child: SvgPicture.asset(Assets.uAnalysis), 
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: AppTheme.darkTheme.textTheme.titleSmall
                    ?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: AppTheme.darkTheme.textTheme.bodySmall
                        ?.copyWith(color: Colors.black54),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
