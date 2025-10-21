import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';

class ChartHeader extends StatelessWidget {
  const ChartHeader({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2F36),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(borderColor), width: 1),
          ),
          child: Row(
            children: [
              Text(
                '7 days',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(width: 4),
              Transform.rotate(
                angle: -(pi / 2),
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
