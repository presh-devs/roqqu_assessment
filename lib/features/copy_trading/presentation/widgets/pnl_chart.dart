import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/chart_header.dart';

class PNLChart extends StatelessWidget {
  const PNLChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
         color: const Color(backgroundColor),
        border: Border.all(color: const Color(borderColor), width: 1),
      
      ),
      child: Column(
        children: [
           ChartHeader(title: 'Total PNL',),
          SizedBox(
            height: 200,
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
                        const dates = [
                          '03-23',
                          '03-24',
                          '03-25',
                          '03-26',
                          '03-27',
                          '03-28',
                        ];
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
}
