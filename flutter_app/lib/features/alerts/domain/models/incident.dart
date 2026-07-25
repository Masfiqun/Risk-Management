enum IncidentPriority {
  low,
  medium,
  high,
  critical,
}

enum IncidentStatus {
  active,
  acknowledged,
  resolved,
}

class Incident {
  final String id;
  final String zoneName;
  final String title;
  final String description;
  final DateTime timestamp;
  final IncidentPriority priority;
  final IncidentStatus status;

  const Incident({
    required this.id,
    required this.zoneName,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.priority,
    required this.status,
  });
}