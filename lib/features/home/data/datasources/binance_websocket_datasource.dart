import 'dart:async';
import 'dart:convert';
import 'package:roqqu_assessment/features/home/data/models/ticker_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketDataSource {
  WebSocketChannel? _channel;
  final _tickerController = StreamController<TickerModel>.broadcast();
  final Set<String> _subscribedSymbols = {};
  Timer? _reconnectTimer;
  bool _isConnecting = false;

  // Use combined streams endpoint for multiple symbols
  static const String _baseUrl = 'wss://fstream.binance.com/stream';

  Stream<TickerModel> get tickerStream => _tickerController.stream;

  void connect(List<String> symbols) {
    if (_isConnecting) return;
    
    if (_channel != null) {
      disconnect();
    }

    _isConnecting = true;
    
    // Build the streams parameter
    final streams = symbols.map((s) => '${s.toLowerCase()}@ticker').toList();
    final streamsParam = streams.join('/');

    final url = '$_baseUrl?streams=$streamsParam';
    print('Connecting to WebSocket: $url');

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _subscribedSymbols.addAll(symbols);
      _isConnecting = false;

      _channel!.stream.listen(
        (data) {
          try {
            final json = jsonDecode(data);

            if (json is Map<String, dynamic>) {
              // Handle combined stream format
              if (json.containsKey('stream') && json.containsKey('data')) {
                final tickerData = json['data'];
                final ticker = TickerModel.fromJson(tickerData);
                _tickerController.add(ticker);
                // print('Received ticker for ${ticker.symbol}: ${ticker.lastPrice}');
              } 
              // Handle single stream format
              else if (json.containsKey('e') && json['e'] == '24hrTicker') {
                final ticker = TickerModel.fromJson(json);
                _tickerController.add(ticker);
                // print('Received ticker for ${ticker.symbol}: ${ticker.lastPrice}');
              }
            }
          } catch (e) {
            print('Error parsing WebSocket data: $e');
          }
        },
        onError: (error) {
          print('WebSocket error: $error');
          _isConnecting = false;
          _scheduleReconnect();
        },
        onDone: () {
          print('WebSocket connection closed');
          _isConnecting = false;
          _scheduleReconnect();
        },
      );
    } catch (e) {
      print('Error connecting to WebSocket: $e');
      _isConnecting = false;
      _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (_subscribedSymbols.isNotEmpty && !_isConnecting) {
        print('Attempting to reconnect...');
        connect(_subscribedSymbols.toList());
      }
    });
  }

  void subscribeToSymbol(String symbol) {
    if (!_subscribedSymbols.contains(symbol)) {
      _subscribedSymbols.add(symbol);
      connect(_subscribedSymbols.toList());
    }
  }

  void unsubscribeFromSymbol(String symbol) {
    if (_subscribedSymbols.contains(symbol)) {
      _subscribedSymbols.remove(symbol);
      if (_subscribedSymbols.isEmpty) {
        disconnect();
      } else {
        connect(_subscribedSymbols.toList());
      }
    }
  }

  void disconnect() {
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
  }

  void dispose() {
    disconnect();
    _tickerController.close();
  }
}