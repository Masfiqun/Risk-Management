import '../domain/models/zone.dart';
import 'zone_api_services.dart';

class DashboardRepository {
  final ZoneApiService apiService = ZoneApiService();

  Future<List<Zone>> getZones() async {
    return await apiService.getZones();
  }
}