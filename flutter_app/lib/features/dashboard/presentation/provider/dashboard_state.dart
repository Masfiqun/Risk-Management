import '../../domain/models/zone.dart';

class DashboardState {
  final bool isLoading;
  final List<Zone> zones;
  final String? error;

  const DashboardState({
    required this.isLoading,
    required this.zones,
    this.error,
  });

  factory DashboardState.initial() {
    return const DashboardState(
      isLoading: false,
      zones: [],
      error: null,
    );
  }

  DashboardState copyWith({
    bool? isLoading,
    List<Zone>? zones,
    String? error,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      zones: zones ?? this.zones,
      error: error,
    );
  }
}