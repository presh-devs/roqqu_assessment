import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/chart_header.dart';

class ROIChart extends StatelessWidget {
  const ROIChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        border: Border.all(color: const Color(0xFF262932), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartHeader(title: 'ROI',),
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
            height: 200,
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
                        const dates = [
                          '03-23',
                          '03-24',
                          '03-25',
                          '03-26',
                          '03-27',
                          '03-28',
                        ];
                        if (value.toInt() >= 0 &&
                            value.toInt() < dates.length) {
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
}
