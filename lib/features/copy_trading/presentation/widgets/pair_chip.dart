import 'package:flutter/material.dart';

class PairChip extends StatelessWidget {
  const PairChip({
    super.key,
    required this.pair,
  });
  final String pair ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2F36),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF262932)),
      ),
      child: Text(
        pair,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
