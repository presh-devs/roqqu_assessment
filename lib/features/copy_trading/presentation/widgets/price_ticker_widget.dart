import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';

class PriceTickerWidget extends ConsumerWidget {
  final String symbol;
  final TextStyle? style;
  final bool showChange;

  const PriceTickerWidget({
    super.key,
    required this.symbol,
    this.style,
    this.showChange = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceMap = ref.watch(priceMapProvider);
    final ticker = priceMap[symbol];

    if (ticker == null) {
      return Text(
        'Loading...',
        style: style ?? const TextStyle(color: Colors.grey),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${ticker.price.toStringAsFixed(4)} USDT',
          style: style ?? const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        // if (showChange) ...[
        //   const SizedBox(width: 8),
        //   Icon(
        //     ticker.isPositive ? Icons.arrow_upward : Icons.arrow_downward,
        //     color: ticker.isPositive ? Colors.green : Colors.red,
        //     size: 14,
        //   ),
        //   const SizedBox(width: 4),
        //   Text(
        //     '${ticker.priceChangePercent.toStringAsFixed(2)}%',
        //     style: TextStyle(
        //       color: ticker.isPositive ? Colors.green : Colors.red,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
