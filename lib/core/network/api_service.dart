import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    );
  }

  Future<Response> get(String path) async {
    return dio.get(path);
  }

  Future<Response> post(
    String path,
    dynamic data,
  ) async {
    return dio.post(
      path,
      data: data,
    );
  }
}