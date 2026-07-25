import '../domain/models/zone.dart';
import 'mock_zones.dart';

class DashboardRepository {
  Future<List<Zone>> getZones() async {

    // Later:
    // final response = await apiService.get(ApiConstants.zones);

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return mockZones;
  }
}