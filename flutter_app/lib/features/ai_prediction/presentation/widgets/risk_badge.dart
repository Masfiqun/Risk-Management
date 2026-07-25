import 'package:flutter/material.dart';

import '../../domain/models/risk_prediction.dart';

class RiskBadge extends StatelessWidget {

  final RiskLevel level;

  const RiskBadge({
    super.key,
    required this.level,
  });

  Color get color {

    switch(level){

      case RiskLevel.safe:
        return Colors.green;

      case RiskLevel.warning:
        return Colors.orange;

      case RiskLevel.critical:
        return Colors.red;

    }

  }

  String get text {

    switch(level){

      case RiskLevel.safe:
        return "SAFE";

      case RiskLevel.warning:
        return "WARNING";

      case RiskLevel.critical:
        return "CRITICAL";

    }

  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),

      decoration: BoxDecoration(

        color: color,

        borderRadius:
            BorderRadius.circular(25),

      ),

      child: Text(

        text,

        style: const TextStyle(

          color: Colors.white,

          fontWeight: FontWeight.bold,

        ),

      ),

    );

  }

}