import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/ai_repository.dart';
import 'ai_state.dart';

class AINotifier extends StateNotifier<AIState> {
  final AIRepository repository;

  AINotifier(this.repository)
      : super(AIState.initial());

  Future<void> loadPrediction() async {
    try {
      state = state.copyWith(isLoading: true);

      final prediction =
          await repository.getPrediction();

      state = state.copyWith(
        isLoading: false,
        prediction: prediction,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}