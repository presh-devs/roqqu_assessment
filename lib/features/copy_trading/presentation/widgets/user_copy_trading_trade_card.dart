import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trade_detail_item.dart';

class UserCopyTradingTradeCard extends StatelessWidget {
  const UserCopyTradingTradeCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                    text: 'BTCUSDT - ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '10X',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF85D1F0),
                        ),
                      ),
                    ],
                  ),  
                ),
                const Spacer(),
                const Text(
                  '+3.28% ROI',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TradeDetailItem(label: 'PRO trader', value: 'BTC master'),
          TradeDetailItem(label: 'Entry price', value: '1.9661 USDT'),
          TradeDetailItem(label: 'Exit price', value: '1.9728 USDT'),
          TradeDetailItem(label: 'PRO trader amount', value: '1009.772 USDT'),
          TradeDetailItem(label: 'Entry time', value: '01:22 PM'),
          TradeDetailItem(label: 'Exit time', value: '01:22 PM'),
        ],
      ),
    );
  }
}
