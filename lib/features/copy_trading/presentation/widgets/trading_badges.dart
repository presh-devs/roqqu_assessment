import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/roqqu_verification_badge.dart';

class TradingBadges extends StatelessWidget {
  const TradingBadges({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
    
          topRight: Radius.circular(16),
        ),
        border: Border.all(color: const Color(0xFF262932), width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Certified PROtrader',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RoqquVerificationBadge(),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF17B26A).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.chart,
                      colorFilter: ColorFilter.mode(
                        Color(0xFF17B26A),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'High win rate',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xFF17B26A),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFF79009).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.uAnalysis,
                      colorFilter: ColorFilter.mode(
                        Color(0xFFF79009),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Great risk control',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xFFF79009),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
