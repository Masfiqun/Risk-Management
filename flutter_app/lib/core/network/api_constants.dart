import 'package:flutter/foundation.dart';

class ApiConstants {
  static String get host {
    if (kIsWeb) {
      return "127.0.0.1";
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return "10.0.2.2"; // Android Emulator

      case TargetPlatform.iOS:
        return "127.0.0.1";

      default:
        return "127.0.0.1";
    }
  }

  static String get apiBaseUrl => "http://$host:8000";

  static String get websocketUrl => "ws://$host:8000/ws";
}