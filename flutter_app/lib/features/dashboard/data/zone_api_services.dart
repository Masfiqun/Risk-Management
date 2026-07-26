import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../domain/models/zone.dart';

class ZoneApiService {
  final Dio dio = ApiClient().dio;

  Future<List<Zone>> getZones() async {
  print("Base URL: ${dio.options.baseUrl}");

  final response = await dio.get("/zones");

  print(response.data);

  final List<dynamic> data = response.data;

  return data
      .map((json) => Zone.fromJson(json as Map<String, dynamic>))
      .toList();
}
}