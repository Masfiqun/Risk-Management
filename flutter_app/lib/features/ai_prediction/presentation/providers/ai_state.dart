import '../../domain/models/risk_prediction.dart';

class AIState {
  final bool isLoading;
  final RiskPrediction? prediction;
  final String? error;

  const AIState({
    required this.isLoading,
    this.prediction,
    this.error,
  });

  factory AIState.initial() {
    return const AIState(
      isLoading: false,
    );
  }

  AIState copyWith({
    bool? isLoading,
    RiskPrediction? prediction,
    String? error,
  }) {
    return AIState(
      isLoading: isLoading ?? this.isLoading,
      prediction: prediction ?? this.prediction,
      error: error,
    );
  }
}