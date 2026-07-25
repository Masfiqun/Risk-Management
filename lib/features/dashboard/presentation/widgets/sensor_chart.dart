import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/models/sensor_point.dart';

class SensorChart extends StatelessWidget {
  final String title;
  final Color color;
  final List<SensorPoint> data;

  const SensorChart({
    super.key,
    required this.title,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),

                  borderData: FlBorderData(show: false),

                  titlesData: const FlTitlesData(
                    topTitles:
                        AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: false),
                    ),
                    rightTitles:
                        AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: false),
                    ),
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: color,
                      barWidth: 4,

                      spots: data
                          .map(
                            (e) => FlSpot(
                              e.x,
                              e.y,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}