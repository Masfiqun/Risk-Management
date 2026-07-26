import 'package:risk_management/features/alerts/domain/models/incident.dart';

import '../../data/mock_incidents.dart';

class IncidentRepository {

  List<Incident> getIncidents() {
    return mockIncidents;
  }

}