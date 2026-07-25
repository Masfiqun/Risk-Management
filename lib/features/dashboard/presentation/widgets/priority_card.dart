import 'package:flutter/material.dart';

class PriorityTile extends StatelessWidget {

  final String zone;

  final String status;

  final Color color;

  const PriorityTile({

    super.key,

    required this.zone,

    required this.status,

    required this.color,

  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: Icon(
          Icons.warning,
          color: color,
        ),

        title: Text(zone),

        trailing: Chip(

          label: Text(status),

          backgroundColor: color,

        ),

      ),

    );

  }

}