import 'dart:async';
import 'dart:convert';
import 'package:roqqu_assessment/features/copy_trading/data/models/ticker_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketDataSource {
  WebSocketChannel? _channel;
  final _tickerController = StreamController<TickerModel>.broadcast();
  final Set<String> _subscribedSymbols = {};

  static const String _baseUrl = 'wss://stream.binance.com:9443/ws';

  Stream<TickerModel> get tickerStream => _tickerController.stream;

  void connect(List<String> symbols) {
    if (_channel != null) {
      disconnect();
    }

    final streams = symbols.map((s) => '${s.toLowerCase()}@ticker').join('/');

    final url = '$_baseUrl/$streams';

    _channel = WebSocketChannel.connect(Uri.parse(url));
    _subscribedSymbols.addAll(symbols);

    _channel!.stream.listen(
      (data) {
        try {
          final json = jsonDecode(data);

          if (json is Map<String, dynamic>) {
            if (json.containsKey('stream') && json.containsKey('data')) {
              final tickerData = json['data'];
              final ticker = TickerModel.fromJson(tickerData);
              _tickerController.add(ticker);
            } else if (json.containsKey('e') && json['e'] == '24hrTicker') {
              final ticker = TickerModel.fromJson(json);
              _tickerController.add(ticker);
            }
          }
        } catch (e) {
          print('Error parsing WebSocket data: $e');
        }
      },
      onError: (error) {
        print('WebSocket error: $error');

        Future.delayed(const Duration(seconds: 5), () {
          if (_subscribedSymbols.isNotEmpty) {
            connect(_subscribedSymbols.toList());
          }
        });
      },
      onDone: () {
        print('WebSocket connection closed');
      },
    );
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
    _channel?.sink.close();
    _channel = null;
  }

  void dispose() {
    disconnect();
    _tickerController.close();
  }
}
