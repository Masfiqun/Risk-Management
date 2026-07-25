import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/incident_repository.dart';

final incidentRepositoryProvider =
    Provider((ref) => IncidentRepository());

final incidentProvider =
    Provider((ref) {
      return ref.read(incidentRepositoryProvider).getIncidents();
    });