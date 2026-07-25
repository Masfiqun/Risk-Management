import 'package:flutter/material.dart';

import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/cards/dashboard_card.dart';
import '../../../core/widgets/chips/status_chip.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SentinelAI Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DashboardCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "System Status",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              const StatusChip(status: ZoneStatus.safe),
              const SizedBox(height: 16),
              PrimaryButton(
                text: "Test Button",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}