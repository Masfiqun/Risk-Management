import 'dart:convert';

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

      startListening();
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

  void startListening() {
    debugPrint("Starting WebSocket...");

    websocket.connect();

    debugPrint("WebSocket Connected");

    websocket.stream.listen(
      (event) {
        debugPrint("========== WEBSOCKET ==========");
        debugPrint(event.toString());

        final data = jsonDecode(event);

        debugPrint(data.toString());
        debugPrint("===============================");
      },
      onError: (e) {
        debugPrint("WebSocket Error: $e");
      },
      onDone: () {
        debugPrint("WebSocket Closed");
      },
    );
  }
}
