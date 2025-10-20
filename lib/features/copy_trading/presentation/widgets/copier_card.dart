import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/copier_model.dart';

class CopierCard extends StatelessWidget {
  final CopierModel copier;
  final Color borderColor;

  const CopierCard({
    super.key,
    required this.copier,
    required this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        
      ),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: borderColor.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: borderColor, width: 0.8),
                ),
                child: Center(
                  child: Text(
                    copier.avatar,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                copier.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total volume',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),

              const Text(
                'Trading profit',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${copier.tradingProfit.toStringAsFixed(2)} USDT',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${copier.totalVolume.toStringAsFixed(2)} USDT',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
