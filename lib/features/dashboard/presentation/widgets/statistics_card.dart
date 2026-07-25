import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {

  final String title;

  final int value;

  final Color color;

  final IconData icon;

  const StatCard({

    super.key,

    required this.title,

    required this.value,

    required this.color,

    required this.icon,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),

            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}