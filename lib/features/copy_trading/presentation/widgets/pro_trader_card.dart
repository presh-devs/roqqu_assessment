import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader.dart';
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF20252B),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border(
                top: BorderSide(color: const Color(0xFF262932), width: 1.0),
                right: BorderSide(color: const Color(0xFF262932), width: 1.0),
                left: BorderSide(color: const Color(0xFF262932), width: 1.0),
              ),
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
                                    trader.initials.toUpperCase(),
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -2,
                                right: 7,
                                child: SvgPicture.asset(Assets.proTraderBaddge),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trader.name,
                              style: textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.users,
                                  colorFilter: ColorFilter.mode(
                                    Color(0xFF85D1F0),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${trader.followers}',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Color(0xFF85D1F0),
                                  ),
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
                        backgroundColor: const Color(0xFF1C2127),
                        side: const BorderSide(color: Color(0xFF262932)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Copy',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Divider(color: Color(0xFF262932), height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ROI',
                          style: textTheme.bodySmall?.copyWith(
                            color: secondaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          trader.roi,
                          style: textTheme.titleMedium?.copyWith(
                            color: const Color(0xFF00C076),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            text: 'Total PNL: ',
                            style: textTheme.bodySmall?.copyWith(
                              color: Color(0xFFA7B1BC),
                            ),
                            children: [
                              TextSpan(
                                text: trader.totalPnl,
                                style: textTheme.labelMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: const Color(0xFF1C2127),
              border: Border.all(color: const Color(0xFF262932)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Win rate: ',
                      style: textTheme.bodySmall?.copyWith(
                        color: Color(0xFFA7B1BC),
                      ),
                    ),
                    Text(
                      trader.winRate,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 14,
                      color: secondaryTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'AUM: ',
                      style: textTheme.bodySmall?.copyWith(
                        color: Color(0xFFA7B1BC),
                      ),
                    ),
                    Text(
                      trader.aum,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
