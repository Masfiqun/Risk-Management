import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/ai_repository.dart';
import 'ai_notifier.dart';
import 'ai_state.dart';

final aiRepositoryProvider =
    Provider<AIRepository>((ref) {
  return AIRepository();
});

final aiProvider =
    StateNotifierProvider<AINotifier, AIState>(
  (ref) {
    return AINotifier(
      ref.read(aiRepositoryProvider),
    );
  },
);