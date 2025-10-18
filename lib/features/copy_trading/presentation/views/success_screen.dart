import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/core/widgets/app_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(
            Assets.success1,
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1D2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 100,
                  color: Colors.green,
                ),
              );
            },
          ),
          Text('Trade copied successfully'),
          Text('You have successfully copied BTC Master’s trade.'),
          AppButton(label: 'Go to Dashboard', onPressed: () {}),
        ],
      ),
    );
  }
}
