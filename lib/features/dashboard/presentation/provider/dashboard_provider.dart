import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_provider.dart';
import '../../data/dashboard_repository.dart';
import 'dashboard_notifier.dart';
import 'dashboard_state.dart';

final dashboardRepositoryProvider =
    Provider((ref) => DashboardRepository());

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) {

    final notifier = DashboardNotifier(

      ref.read(dashboardRepositoryProvider),

      ref.read(websocketProvider),

    );

    return notifier;
  },
);