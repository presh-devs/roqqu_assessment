import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';

class RoqquVerificationBadge extends StatelessWidget {
  const RoqquVerificationBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.roqquIcon, width: 18, height: 18),
        const SizedBox(width: 8),
        SvgPicture.asset(Assets.verifiedBadge, width: 16, height: 16),
      ],
    );
  }
}
