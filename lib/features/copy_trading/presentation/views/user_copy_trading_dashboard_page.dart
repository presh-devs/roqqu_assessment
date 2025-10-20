import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_chart_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_my_traders_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_current_trades_tab.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/user_copy_trading_statistics_tab.dart';

class UserCopyTradingDashboardPage extends StatefulWidget {
  const UserCopyTradingDashboardPage({super.key});

  @override
  State<UserCopyTradingDashboardPage> createState() =>
      _UserCopyTradingDashboardPageState();
}

class _UserCopyTradingDashboardPageState
    extends State<UserCopyTradingDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: const Text('My Dashboard')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF20252B),
                    border: Border.all(color: const Color(0xFF262932)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Copy trading assets',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '\$5,564.96',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(height: 1, color: Color(0xFF262932)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Net profit',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '\$5,564.96',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Today's PNL",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.upTrendIcon,
                                      colorFilter: ColorFilter.mode(
                                        Color(0xFF17B26A),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '207.25',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF20252B),
                      border: Border.all(color: const Color(0xFF262932)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            color: Color(0XFF1C2127),
                            border: Border.all(color: Color(0XFF262932)),
                          ),

                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            indicatorColor: const Color(0xFF85D1F0),
                            labelColor: Colors.white,
                            unselectedLabelColor: const Color(0xFFA7B1BC),
                            tabs: const [
                              Tab(text: 'Chart'),
                              Tab(
                                child: FittedBox(child: Text('Current trades')),
                              ),
                              Tab(text: 'Stats'),
                              Tab(text: 'My traders'),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: [
                              UserCopyTradingChartTab(),
                              UserCopyTradingCurrentTradesTab(),
                              StatisticsScreen(),
                              UserCopyTradingMyTradersTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
