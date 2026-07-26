import 'package:risk_management/features/dashboard/data/zone_api_services.dart';


Future<List<dynamic>> getZones() async {
  final service = ZoneApiService();
  return await service.getZones();
}