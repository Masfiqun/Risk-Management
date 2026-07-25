import '../domain/models/risk_prediction.dart';
import 'mock_prediction.dart';

class AIRepository {
  Future<RiskPrediction> getPrediction() async {
    await Future.delayed(const Duration(seconds: 1));

    return mockPrediction;
  }
}