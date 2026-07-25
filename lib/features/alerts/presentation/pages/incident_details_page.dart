import 'package:flutter/material.dart';

import '../../domain/models/incident.dart';

class IncidentDetailsPage extends StatelessWidget {

  final Incident incident;

  const IncidentDetailsPage({
    super.key,
    required this.incident,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Incident Details"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              incident.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text("Zone: ${incident.zoneName}"),

            const SizedBox(height: 10),

            Text("Status: ${incident.status.name}"),

            const SizedBox(height: 10),

            Text("Priority: ${incident.priority.name}"),

            const SizedBox(height: 20),

            Text(incident.description),

            const Spacer(),

            FilledButton(

              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(

                  const SnackBar(

                    content: Text(
                      "Incident Acknowledged",
                    ),

                  ),

                );

              },

              child: const Text(
                "ACKNOWLEDGE",
              ),

            )

          ],

        ),

      ),

    );

  }

}