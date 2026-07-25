enum ZoneStatus {
  safe,
  warning,
  critical,
  offline,
}

class Zone {
  final String id;
  final String name;
  final ZoneStatus status;
  final double temperature;
  final double humidity;
  final double gasLevel;
  final bool fireDetected;

  const Zone({
    required this.id,
    required this.name,
    required this.status,
    required this.temperature,
    required this.humidity,
    required this.gasLevel,
    required this.fireDetected,
  });
}