import '../domain/models/incident.dart';
import 'mock_incidents.dart';

class IncidentRepository {
  List<Incident> getIncidents() {
    return mockIncidents;
  }
}