import 'package:flutter/material.dart';

import '../../domain/models/zone.dart';

class LiveZoneCard extends StatelessWidget {
  final Zone zone;
  final VoidCallback onTap;

  const LiveZoneCard({
    super.key,
    required this.zone,
    required this.onTap,
  });

  Color get statusColor {
    switch (zone.status) {
      case ZoneStatus.safe:
        return Colors.green;

      case ZoneStatus.warning:
        return Colors.orange;

      case ZoneStatus.critical:
        return Colors.red;

      case ZoneStatus.offline:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.only(bottom: 12),

      child: InkWell(

        borderRadius: BorderRadius.circular(12),

        onTap: onTap,

        child: Padding(

          padding: const EdgeInsets.all(16),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row(

                children: [

                  CircleAvatar(
                    radius: 8,
                    backgroundColor: statusColor,
                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child: Text(

                      zone.name,

                      style: const TextStyle(

                        fontSize: 18,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                  Chip(
                    label: Text(
                      zone.status.name.toUpperCase(),
                    ),
                  ),

                ],

              ),

              const SizedBox(height: 16),

              Row(

                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  _sensor(
                    Icons.thermostat,
                    "${zone.temperature}°C",
                  ),

                  _sensor(
                    Icons.water_drop,
                    "${zone.humidity}%",
                  ),

                  _sensor(
                    Icons.air,
                    "${zone.gasLevel}",
                  ),

                ],

              ),

            ],

          ),

        ),

      ),

    );

  }

  Widget _sensor(
    IconData icon,
    String value,
  ) {

    return Column(

      children: [

        Icon(icon),

        const SizedBox(height: 6),

        Text(value),

      ],

    );

  }

}