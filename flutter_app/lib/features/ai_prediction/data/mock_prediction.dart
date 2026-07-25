import '../domain/models/risk_prediction.dart';

final mockPrediction = RiskPrediction(
  overallRisk: 89,

  fireProbability: 92,

  gasProbability: 85,

  confidence: 96,

  predictionTime: DateTime.now(),

  hazards: [
    "High Temperature",
    "Gas Leakage",
    "Smoke Detected",
  ],

  riskLevel: RiskLevel.critical,

  recommendation:
      "Immediate evacuation recommended.\nActivate suppression system.\nNotify emergency services.",
);