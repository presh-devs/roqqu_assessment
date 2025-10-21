import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';

class StatisticsCardWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isRed;

  const StatisticsCardWidget({
    super.key,
    required this.label,
    required this.value,
    this.isRed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(backgroundColor),
        border: Border.all(color: const Color(borderColor)),
      ),

      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF8931A),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(Assets.btcIcon, width: 24, height: 24),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(borderColor),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(backgroundColor), width: 2),
                  ),
                  child: SvgPicture.asset(Assets.forwardArrow, )),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isRed ? Colors.red : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
