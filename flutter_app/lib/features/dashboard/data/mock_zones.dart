import '../domain/models/zone.dart';

const mockZones = [

  Zone(
    id: "1",
    name: "Server Room",
    status: ZoneStatus.critical,
    temperature: 52,
    humidity: 38,
    gasLevel: 650,
    fireDetected: true,
  ),

  Zone(
    id: "2",
    name: "IoT Lab",
    status: ZoneStatus.warning,
    temperature: 39,
    humidity: 48,
    gasLevel: 220,
    fireDetected: false,
  ),

  Zone(
    id: "3",
    name: "Robotics Lab",
    status: ZoneStatus.safe,
    temperature: 27,
    humidity: 52,
    gasLevel: 120,
    fireDetected: false,
  ),

  Zone(
    id: "4",
    name: "Electrical Lab",
    status: ZoneStatus.offline,
    temperature: 0,
    humidity: 0,
    gasLevel: 0,
    fireDetected: false,
  ),

];