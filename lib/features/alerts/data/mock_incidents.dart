import '../domain/models/incident.dart';

final mockIncidents = [

  Incident(
    id: "1",
    zoneName: "Server Room",
    title: "Fire Detected",
    description: "High temperature and smoke detected.",
    timestamp: DateTime.now(),
    priority: IncidentPriority.critical,
    status: IncidentStatus.active,
  ),

  Incident(
    id: "2",
    zoneName: "IoT Lab",
    title: "Gas Leakage",
    description: "MQ sensor crossed threshold.",
    timestamp: DateTime.now(),
    priority: IncidentPriority.high,
    status: IncidentStatus.active,
  ),

  Incident(
    id: "3",
    zoneName: "Electrical Lab",
    title: "Device Offline",
    description: "ESP32 not responding.",
    timestamp: DateTime.now(),
    priority: IncidentPriority.medium,
    status: IncidentStatus.acknowledged,
  ),

];