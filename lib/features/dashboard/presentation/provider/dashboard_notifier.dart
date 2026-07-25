import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/websocket_service.dart';
import '../../data/dashboard_repository.dart';
import '../../domain/models/zone.dart';
import 'dashboard_state.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashboardRepository repository;
  final WebSocketService websocket;

  DashboardNotifier(
    this.repository,
    this.websocket,
  ) : super(DashboardState.initial());

  Future<void> loadDashboard() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
      );

      final zones = await repository.getZones();

      state = state.copyWith(
        isLoading: false,
        zones: zones,
      );

      await simulateSensorUpdate();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    await loadDashboard();
  }

  Future<void> simulateSensorUpdate() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    final updated = [...state.zones];

    if (updated.isNotEmpty) {
      final zone = updated.first;

      updated[0] = Zone(
        id: zone.id,
        name: zone.name,
        status: ZoneStatus.warning,
        temperature: zone.temperature + 2,
        humidity: zone.humidity,
        gasLevel: zone.gasLevel + 40,
        fireDetected: zone.fireDetected,
      );
    }

    state = state.copyWith(
      zones: updated,
    );
  }

  void startListening() {
    websocket.connect();

    websocket.stream.listen(
      (event) {
        debugPrint("Received: $event");

        // We'll parse JSON later
      },
      onError: (e) {
        debugPrint("WebSocket Error: $e");
      },
    );
  }
}
