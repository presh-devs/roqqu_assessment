import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/widgets/app_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(backgroundColor),
        border: Border(
          top: BorderSide(color: const Color(borderColor), width: 1),
        ),
      ),
      child: Column(
        children: [
          AppButton(label: label, onPressed: onPressed),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
