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

  factory Zone.fromJson(Map<String, dynamic> json) {
    return Zone(
      id: json["id"].toString(),
      name: json["name"],
      status: _parseStatus(json["status"]),
      temperature: (json["temperature"] as num).toDouble(),
      humidity: (json["humidity"] as num).toDouble(),
      gasLevel: (json["gasLevel"] as num).toDouble(),
      fireDetected: json["fireDetected"],
    );
  }

  static ZoneStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case "safe":
        return ZoneStatus.safe;
      case "warning":
        return ZoneStatus.warning;
      case "critical":
        return ZoneStatus.critical;
      default:
        return ZoneStatus.offline;
    }
  }
}