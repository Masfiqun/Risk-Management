import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../constants/api_constants.dart';

class WebSocketService {
  WebSocketChannel? _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse(ApiConstants.websocketUrl),
    );
  }

  Stream<dynamic> get stream => _channel!.stream;

  void send(Map<String, dynamic> data) {
    _channel?.sink.add(jsonEncode(data));
  }

  void disconnect() {
    _channel?.sink.close();
  }

  bool get isConnected => _channel != null;
}