import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/chart_header.dart';

class HoldingPeriodChart extends StatelessWidget {
  const HoldingPeriodChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        border: Border.all(color: const Color(0xFF262932), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ChartHeader(title:   'Holding Period',),
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
                        if (value.toInt() >= 0 &&
                            value.toInt() < labels.length) {
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
                  ScatterSpot(
                    0.2,
                    64.5,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    0.4,
                    65,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    0.6,
                    64.8,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    0.8,
                    65.2,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    1.1,
                    64.3,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    1.3,
                    65.5,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    1.5,
                    64.9,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    1.8,
                    65.3,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    2.1,
                    65.7,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    2.3,
                    65.1,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    2.5,
                    66,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    2.7,
                    65.8,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    2.9,
                    66.2,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.green,
                      radius: 4,
                    ),
                  ),
                  // Loss spots (red)
                  ScatterSpot(
                    0.5,
                    63.8,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.red,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    1.7,
                    63.5,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.red,
                      radius: 4,
                    ),
                  ),
                  ScatterSpot(
                    2.4,
                    63.3,
                    dotPainter: FlDotCirclePainter(
                      color: Colors.red,
                      radius: 4,
                    ),
                  ),
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
