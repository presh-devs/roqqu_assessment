import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trade_model.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/providers/copy_trading_providers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trade_detail_item.dart';

class TradeCardWidget extends ConsumerWidget {
  final TradeModel trade;

  const TradeCardWidget({super.key, required this.trade});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceMap = ref.watch(priceMapProvider);
    final currentPrice = priceMap[trade.symbol]?.price ?? trade.currentPrice;

    final roi =
        ((currentPrice - trade.entryPrice) / trade.entryPrice) *
        100 *
        trade.leverage;
    final roiColor = roi >= 0 ? Colors.green : Colors.red;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(color: const Color(0xFF2A2F37)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.currency_bitcoin,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Text.rich(
                  TextSpan(
                    text: '${trade.symbol} - ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '${trade.leverage}X',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF85D1F0),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '${roi >= 0 ? '+' : ''}${roi.toStringAsFixed(2)}% ROI',
                  style: TextStyle(
                    color: roiColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          TradeDetailItem(label: 'PRO trader', value: trade.traderName),
          TradeDetailItem(
            label: 'Entry price',
            value: '${trade.entryPrice.toStringAsFixed(4)} USDT',
          ),
          TradeDetailItem(
            label: trade.isActive ? 'Market price' : 'Exit price',
            value: '${currentPrice.toStringAsFixed(4)} USDT',
          ),
          TradeDetailItem(
            label: 'Entry time',
            value:
                '${trade.entryTime.hour.toString().padLeft(2, '0')}:${trade.entryTime.minute.toString().padLeft(2, '0')} ${trade.entryTime.hour >= 12 ? 'PM' : 'AM'}',
          ),
        ],
      ),
    );
  }

  Widget _buildTradeDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Row(
            children: [
              if (label == 'PRO trader')
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'B',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
