import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../zones/presentation/pages/zone_details_page.dart';
import '../../data/mock_sensor_history.dart';
import '../../domain/models/zone.dart';
import '../provider/dashboard_provider.dart';
import '../widgets/live_zone_card.dart';
import '../widgets/sensor_chart.dart';
import '../widgets/statistics_card.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState
    extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(dashboardProvider.notifier)
        ..loadDashboard()
        ..startListening();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("SentinelAI"),
        ),
        body: Center(
          child: Text(state.error!),
        ),
      );
    }

    final safeCount = state.zones
        .where((z) => z.status == ZoneStatus.safe)
        .length;

    final warningCount = state.zones
        .where((z) => z.status == ZoneStatus.warning)
        .length;

    final criticalCount = state.zones
        .where((z) => z.status == ZoneStatus.critical)
        .length;

    final offlineCount = state.zones
        .where((z) => z.status == ZoneStatus.offline)
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SentinelAI"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(dashboardProvider.notifier)
              .refresh();
        },

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [

            const Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Campus Status Overview",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            GridView.count(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),

              crossAxisCount: 2,

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              childAspectRatio: 1.15,

              children: [

                StatCard(
                  title: "SAFE",
                  value: safeCount,
                  color: Colors.green,
                  icon: Icons.check_circle,
                ),

                StatCard(
                  title: "WARNING",
                  value: warningCount,
                  color: Colors.orange,
                  icon: Icons.warning,
                ),

                StatCard(
                  title: "CRITICAL",
                  value: criticalCount,
                  color: Colors.red,
                  icon: Icons.error,
                ),

                StatCard(
                  title: "OFFLINE",
                  value: offlineCount,
                  color: Colors.grey,
                  icon: Icons.wifi_off,
                ),

              ],
            ),

            const SizedBox(height: 30),

            SensorChart(
              title: "Temperature",
              color: Colors.red,
              data: temperatureHistory,
            ),

            SensorChart(
              title: "Humidity",
              color: Colors.blue,
              data: humidityHistory,
            ),

            SensorChart(
              title: "Gas Level",
              color: Colors.orange,
              data: gasHistory,
            ),

            const SizedBox(height: 30),

            const Text(
              "Live Monitoring",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            if (state.zones.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "No Zones Available",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            ...state.zones.map((zone) {

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),

                child: LiveZoneCard(

                  zone: zone,

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            ZoneDetailsPage(
                          zone: zone,
                        ),

                      ),

                    );

                  },

                ),
              );

            }).toList(),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}