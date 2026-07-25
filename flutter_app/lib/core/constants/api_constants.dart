class ApiConstants {
  ApiConstants._();

  // Change this later to your FastAPI server
  static const String baseUrl = "http://192.168.1.100:8000";

  static const String websocketUrl =
      "ws://192.168.1.100:8000/ws";

  static const String zones = "/zones";

  static const String incidents = "/incidents";

  static const String login = "/auth/login";
}