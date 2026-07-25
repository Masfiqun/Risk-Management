enum RiskLevel {
  safe,
  warning,
  critical,
}

class RiskPrediction {
  final double overallRisk;
  final double fireProbability;
  final double gasProbability;

  final double confidence;

  final DateTime predictionTime;

  final List<String> hazards;

  final RiskLevel riskLevel;

  final String recommendation;

  const RiskPrediction({
    required this.overallRisk,
    required this.fireProbability,
    required this.gasProbability,
    required this.confidence,
    required this.predictionTime,
    required this.hazards,
    required this.riskLevel,
    required this.recommendation,
  });
}