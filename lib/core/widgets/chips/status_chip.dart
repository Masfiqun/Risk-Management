import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

enum ZoneStatus {
  safe,
  warning,
  critical,
}

class StatusChip extends StatelessWidget {
  final ZoneStatus status;

  const StatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case ZoneStatus.safe:
        color = AppColors.success;
        text = "SAFE";
        break;

      case ZoneStatus.warning:
        color = AppColors.warning;
        text = "WARNING";
        break;

      case ZoneStatus.critical:
        color = AppColors.danger;
        text = "CRITICAL";
        break;
    }

    return Chip(
      label: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
  }
}