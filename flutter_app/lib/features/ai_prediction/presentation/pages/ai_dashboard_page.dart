import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ai_provider.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/risk_meter.dart';
import '../widgets/risk_badge.dart';
import '../widgets/info_card.dart';
import '../widgets/hazard_card.dart';

class AIDashboardPage extends ConsumerStatefulWidget {
  const AIDashboardPage({super.key});

  @override
  ConsumerState<AIDashboardPage> createState() =>
      _AIDashboardPageState();
}

class _AIDashboardPageState
    extends ConsumerState<AIDashboardPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(aiProvider.notifier)
          .loadPrediction();
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(aiProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("AI Analysis"),
        ),
        body: Center(
          child: Text(state.error!),
        ),
      );
    }

    final prediction = state.prediction!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Risk Analysis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            RiskBadge(
              level: prediction.riskLevel,
            ),

            const SizedBox(height: 20),

            RiskMeter(
              title: "Overall Risk",
              value: prediction.overallRisk,
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: RiskMeter(
                    title: "Fire",
                    value: prediction.fireProbability,
                    color: Colors.orange,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: RiskMeter(
                    title: "Gas",
                    value: prediction.gasProbability,
                    color: Colors.blue,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            InfoCard(
              title: "Confidence",
              value: "${prediction.confidence.toInt()}%",
              icon: Icons.analytics,
            ),

            InfoCard(
              title: "Prediction Time",
              value:
                  prediction.predictionTime.toString(),
              icon: Icons.schedule,
            ),

            HazardCard(
              hazards: prediction.hazards,
            ),

            RecommendationCard(
              recommendation:
                  prediction.recommendation,
            ),

          ],
        ),
      )
    );
  }
}