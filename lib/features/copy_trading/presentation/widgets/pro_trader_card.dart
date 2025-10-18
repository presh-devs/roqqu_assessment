import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/features/copy_trading/domain/trader.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading_dashboard.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/sparkline_painter.dart';

class ProTraderCard extends StatelessWidget {
  final ProTrader trader;
  final VoidCallback onTap;

  const ProTraderCard({super.key, required this.trader, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final secondaryTextColor = const Color(0xFFA7B1BC);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C2127),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF262932)),
        ),
        child: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF5283FF),
                                width: 1.0,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFF2A2F36),
                              child: Text(
                                trader.initials,
                                style: textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: SvgPicture.asset(Assets.proTraderBaddge),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trader.name, style: textTheme.titleSmall),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined,
                                size: 14, color: secondaryTextColor),
                            const SizedBox(width: 4),
                            Text(
                              '${trader.followers}',
                              style: textTheme.bodySmall
                                  ?.copyWith(color: secondaryTextColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF262932)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Copy'),
                ),
              ],
            ),
            const SizedBox(height: 16),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ROI', style: textTheme.bodySmall?.copyWith(color: secondaryTextColor)),
                    const SizedBox(height: 4),
                    Text(
                      trader.roi,
                      style: textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF00C076),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                     Text('Total PNL: ${trader.totalPnl}', style: textTheme.bodySmall?.copyWith(color: secondaryTextColor)),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: CustomPaint(
                    painter: SparklinePainter(data: trader.chartData),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xFF262932), height: 32),
            // Bottom Section: Win Rate, AUM
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                     Text('Win rate: ', style: textTheme.bodySmall?.copyWith(color: secondaryTextColor)),
                     Text(trader.winRate, style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 14, color: secondaryTextColor),
                    const SizedBox(width: 4),
                    Text('AUM: ', style: textTheme.bodySmall?.copyWith(color: secondaryTextColor)),
                     Text(trader.aum, style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
