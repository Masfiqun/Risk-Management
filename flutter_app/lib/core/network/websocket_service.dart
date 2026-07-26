import 'package:web_socket_channel/web_socket_channel.dart';

import 'api_constants.dart';

class WebSocketService {
  WebSocketChannel? _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse(ApiConstants.websocketUrl),
    );
  }

  Stream get stream => _channel!.stream;

  void send(String message) {
    _channel?.sink.add(message);
  }

  void dispose() {
    _channel?.sink.close();
  }
}