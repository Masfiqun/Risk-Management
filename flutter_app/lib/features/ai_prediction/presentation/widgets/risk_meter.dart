import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RiskMeter extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  const RiskMeter({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            CircularPercentIndicator(
              radius: 70,
              lineWidth: 10,
              animation: true,
              animationDuration: 1200,
              percent: value / 100,
              progressColor: color,
              backgroundColor: Colors.grey.shade300,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "${value.toInt()}%",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}