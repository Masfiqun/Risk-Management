import 'package:flutter/material.dart';

import '../../domain/models/incident.dart';

class IncidentCard extends StatelessWidget {

  final Incident incident;
  final VoidCallback onTap;

  const IncidentCard({
    super.key,
    required this.incident,
    required this.onTap,
  });

  Color get priorityColor {

    switch (incident.priority) {

      case IncidentPriority.low:
        return Colors.green;

      case IncidentPriority.medium:
        return Colors.orange;

      case IncidentPriority.high:
        return Colors.deepOrange;

      case IncidentPriority.critical:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        onTap: onTap,

        leading: Icon(
          Icons.warning,
          color: priorityColor,
        ),

        title: Text(incident.title),

        subtitle: Text(incident.zoneName),

        trailing: Chip(

          label: Text(
            incident.priority.name.toUpperCase(),
          ),

          backgroundColor: priorityColor,

        ),

      ),

    );

  }

}