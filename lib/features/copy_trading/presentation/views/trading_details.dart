import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/important_message_sheet.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/risks_bottom_sheet.dart';


class TradingDetailsScreen extends StatefulWidget {
  const TradingDetailsScreen({super.key});

  @override
  State<TradingDetailsScreen> createState() => _TradingDetailsScreenState();
}

class _TradingDetailsScreenState extends State<TradingDetailsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Trading details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildStats(),
            _buildBadges(),
            _buildTabs(),
            _buildROIChart(),
            _buildCopyTradeButton(),
            _buildEquityChart(),
            _buildAssetAllocation(),
            _buildHoldingPeriod(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF2D3250),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'BM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BTC master',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'PNL 200 Copiers',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.verified,
            color: Colors.purple.shade300,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('+3 trading days', '43 trading days'),
          _buildStatItem('95% profit-share', '95% profit-share'),
          _buildStatItem('99 total orders', '99 total orders'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildBadges() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Certified PROtrader',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.green, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'High win rate',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.orange, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Great risk control',
                      style: TextStyle(color: Colors.orange, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildTab('Chart', 0),
          _buildTab('Stats', 1),
          _buildTab('All Trades', 2),
          _buildTab('Copiers', 3),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2D3250) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildROIChart() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232842),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ROI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3250),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Text(
                      '7 days',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '123%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}%',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const dates = ['03-23', '03-24', '03-25', '03-26', '03-27', '03-28'];
                        if (value.toInt() >= 0 && value.toInt() < dates.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              dates[value.toInt()],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 5,
                minY: 122,
                maxY: 126,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 122.5),
                      const FlSpot(1, 123),
                      const FlSpot(2, 123.5),
                      const FlSpot(3, 124),
                      const FlSpot(4, 124.8),
                      const FlSpot(5, 125.5),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.green.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyTradeButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C5CE7), Color(0xFFE91E63)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () {
          _showImportantMessageDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Copy trade',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showImportantMessageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) => const ImportantMessageSheet(),
    );
  }

  void _showRisksBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const RisksBottomSheet(),
    );
  }

  Widget _buildEquityChart() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232842),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}k',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const dates = ['03-23', '03-24', '03-25', '03-26', '03-27', '03-28'];
                        if (value.toInt() >= 0 && value.toInt() < dates.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              dates[value.toInt()],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 5,
                minY: 63,
                maxY: 67,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 63.5),
                      const FlSpot(1, 64),
                      const FlSpot(2, 64.5),
                      const FlSpot(3, 65),
                      const FlSpot(4, 65.8),
                      const FlSpot(5, 66.5),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.green.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetAllocation() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232842),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Assets allocation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3250),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Text(
                      '7 days',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              width: 180,
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 60,
                      sections: [
                        PieChartSectionData(
                          color: Colors.orange,
                          value: 100,
                          title: '',
                          radius: 30,
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BTC/USDT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '100.00%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoldingPeriod() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232842),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Holding period',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3250),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Text(
                      '7 days',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ScatterChart(
              ScatterChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}k',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const labels = ['1m', '24h', '5d', '15d'];
                        if (value.toInt() >= 0 && value.toInt() < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              labels[value.toInt()],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 3,
                minY: 63,
                maxY: 67,
                scatterSpots: [
                  // Profit spots (green)
                  ScatterSpot(0.2, 64.5,dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(0.4, 65, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(0.6, 64.8, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(0.8, 65.2, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(1.1, 64.3, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(1.3, 65.5, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(1.5, 64.9, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(1.8, 65.3, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(2.1, 65.7, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(2.3, 65.1, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(2.5, 66, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(2.7, 65.8, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  ScatterSpot(2.9, 66.2, dotPainter: FlDotCirclePainter (color: Colors.green, radius: 4)),
                  // Loss spots (red)
                  ScatterSpot(0.5, 63.8, dotPainter: FlDotCirclePainter (color: Colors.red, radius: 4)),
                  ScatterSpot(1.7, 63.5, dotPainter: FlDotCirclePainter (color: Colors.red, radius: 4)),
                  ScatterSpot(2.4, 63.3, dotPainter: FlDotCirclePainter (color: Colors.red, radius: 4)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Profit',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Loss',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}


