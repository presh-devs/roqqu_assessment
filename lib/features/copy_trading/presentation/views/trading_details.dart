import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/trader.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/all_trades.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copiers.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_dashboard/user_copy_trading_statistics_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/bottom_bar.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/important_message_sheet.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trading_badges.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trading_details_chart_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/trading_details_stat_item.dart';

class TradingDetailsScreen extends StatefulWidget {
  const TradingDetailsScreen({super.key, required this.trader});
  final ProTrader trader;

  @override
  State<TradingDetailsScreen> createState() => _TradingDetailsScreenState();
}

class _TradingDetailsScreenState extends State<TradingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: const Text('Trading details')),
        bottomNavigationBar: BottomBar(
          label: 'Copy trade',
          onPressed: () {
            _showImportantMessageSheet(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                widget.trader.initials.toUpperCase(),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
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
                          widget.trader.name,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
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
                              '${widget.trader.followers} copiers',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Color(0xFF85D1F0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TradingDetailsStatItem(
                      value: '${widget.trader.daysTraded} trading days',
                    ),
                    TradingDetailsStatItem(
                      value: '${widget.trader.percentangeProfit} profit-share',
                    ),
                    TradingDetailsStatItem(
                      value: '${widget.trader.totalTrades} total orders',
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TradingBadges(context: context),
                SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF262932)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          indicatorColor: Color(0xFF85D1F0),
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xFFA7B1BC),
                          tabs: [
                            Tab(child: Text('Chart')),
                            Tab(child: Text('Stats')),
                            Tab(child: FittedBox(child: Text('All Trades'))),
                            Tab(child: Text('Copiers')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1000,
                  child: TabBarView(
                    children: [
                      TradingDetailsChartTab(),
                      StatisticsTab(),
                   AllTradesTab(),
                    CopiersTab(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showImportantMessageSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    barrierColor: Colors.black.withOpacity(0.8),
    builder: (context) => const ImportantMessageSheet(),
  );
}


