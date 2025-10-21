import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
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
      decoration: BoxDecoration(color: const Color(0xFF20252B)),
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
}

class ProTraderTradeCardWidget extends ConsumerWidget {
  final TradeModel trade;
  final bool? isActive;

  const ProTraderTradeCardWidget({
    super.key,
    required this.trade,
    this.isActive,
  });

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
      decoration: BoxDecoration(color: const Color(0xFF20252B)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(color: const Color(0xFF2A2F37)),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    Assets.btcIcon,
                    width: 24,
                    height: 24,
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

          TradeDetailItem(
            label: 'Entry price',
            value: '${trade.entryPrice.toStringAsFixed(4)} USDT',
          ),
          TradeDetailItem(
            label: trade.isActive ? 'Market price' : 'Exit price',
            value: '${currentPrice.toStringAsFixed(4)} USDT',
          ),
          TradeDetailItem(label: 'Copiers', value: trade.copiers.toString()),
          TradeDetailItem(
            label: 'Copiers amount',
            value: trade.copiersAmount.toString(),
          ),
          TradeDetailItem(
            label: 'Entry time',
            value:
                '${trade.entryTime.hour.toString().padLeft(2, '0')}:${trade.entryTime.minute.toString().padLeft(2, '0')} ${trade.entryTime.hour >= 12 ? 'PM' : 'AM'}',
          ),
          isActive == false
              ? TradeDetailItem(
                  label: 'Exit time',
                  value:
                      '${trade.exitTime?.hour.toString().padLeft(2, '0')}:${trade.exitTime?.minute.toString().padLeft(2, '0')} ${trade.exitTime!.hour >= 12 ? 'PM' : 'AM'}',
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
