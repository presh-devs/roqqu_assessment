import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/bottom_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        label: 'Go to Dashboard',
        onPressed: () =>
            context.pushReplacement('/user-copy-trading-dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          SvgPicture.asset(
            Assets.success1,
            errorBuilder: (context, error, stackTrace) {
              return Container(
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
          Center(
            child: Text(
              'Trade copied successfully',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'You have successfully copied BTC Master’s trade.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Color(0xFFA7B1BC)),
            ),
          ),
        ],
      ),
    );
  }
}
