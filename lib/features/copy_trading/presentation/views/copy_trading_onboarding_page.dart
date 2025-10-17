import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopyTradingOnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CopyTradingOnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFFA7B1BC)),
        ),
        Spacer(),
        Center(
          child: SvgPicture.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
