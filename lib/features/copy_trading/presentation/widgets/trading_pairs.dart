import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/pair_chip.dart';

class TradingPairs extends StatelessWidget {
  const TradingPairs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trading pairs',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            PairChip(pair: 'BTCUSDT'),
            PairChip(pair: 'ETHUSDT'),
            PairChip(pair: 'XRPUSDT'),
            PairChip(pair: 'TIAUSDT'),
            PairChip(pair: 'DOGEUSDT'),
            PairChip(pair: 'PERPUSDT'),
            PairChip(pair: 'TIAUSDT'),
            PairChip(pair: 'DOGEUSDT'),
            PairChip(pair: 'PERPUSDT'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
