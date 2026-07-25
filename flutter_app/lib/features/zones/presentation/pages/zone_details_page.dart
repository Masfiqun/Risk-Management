import 'package:flutter/material.dart';

import '../../../dashboard/domain/models/zone.dart';

class ZoneDetailsPage extends StatelessWidget {
  final Zone zone;

  const ZoneDetailsPage({
    super.key,
    required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(zone.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            _buildStatusCard(),

            const SizedBox(height: 20),

            _buildSensorCard(),

            const SizedBox(height: 20),

            _buildLastUpdated(),

          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text(
              "Current Status",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              zone.status.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSensorCard() {
    return Card(
      child: Column(
        children: [

          ListTile(
            leading: const Icon(Icons.thermostat),
            title: const Text("Temperature"),
            trailing: Text("${zone.temperature} °C"),
          ),

          ListTile(
            leading: const Icon(Icons.water_drop),
            title: const Text("Humidity"),
            trailing: Text("${zone.humidity}%"),
          ),

          ListTile(
            leading: const Icon(Icons.air),
            title: const Text("Gas Level"),
            trailing: Text("${zone.gasLevel} ppm"),
          ),

          ListTile(
            leading: const Icon(Icons.local_fire_department),
            title: const Text("Fire"),
            trailing: Text(
              zone.fireDetected
                  ? "DETECTED"
                  : "NOT DETECTED",
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildLastUpdated() {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.access_time),
        title: Text("Last Updated"),
        trailing: Text("10:30 AM"),
      ),
    );
  }
}