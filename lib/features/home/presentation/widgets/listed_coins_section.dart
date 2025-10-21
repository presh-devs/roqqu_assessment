import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/features/home/data/datasources/binance_websocket_datasource.dart';
import 'package:roqqu_assessment/features/home/data/models/ticker_model.dart';
import 'package:roqqu_assessment/features/home/data/repositories/price_repository_impl.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/coin_tile.dart';

class ListedCoinsSection extends StatefulWidget {
  const ListedCoinsSection({super.key});

  @override
  State<ListedCoinsSection> createState() => _ListedCoinsSectionState();
}

class _ListedCoinsSectionState extends State<ListedCoinsSection> {
  late final PriceRepositoryImpl _priceRepository;
  
  // Store the latest ticker data for each symbol
  final Map<String, TickerModel> _tickerData = {};
  
  // Coin configurations
  final List<CoinConfig> _coins = [
    CoinConfig(
      symbol: 'BTCUSDT',
      name: 'Bitcoin',
      ticker: 'BTC',
      iconUrl: 'https://seeklogo.com/images/B/bitcoin-logo-D193D7D737-seeklogo.com.png',
    ),
    CoinConfig(
      symbol: 'ETHUSDT',
      name: 'Ethereum',
      ticker: 'ETH',
      iconUrl: 'https://seeklogo.com/images/E/ethereum-logo-EC6CDBA45B-seeklogo.com.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeWebSocket();
  }

  void _initializeWebSocket() {
    final dataSource = BinanceWebSocketDataSource();
    _priceRepository = PriceRepositoryImpl(dataSource);
    
    // Get list of symbols to subscribe to
    final symbols = _coins.map((c) => c.symbol).toList();
    
    // Listen to the price stream
    _priceRepository.getPriceStream(symbols).listen(
      (ticker) {
        if (mounted) {
          setState(() {
            _tickerData[ticker.symbol] = ticker;
          });
        }
      },
      onError: (error) {
        print('Error receiving ticker data: $error');
      },
    );
  }

  @override
  void dispose() {
    _priceRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Listed Coins',
                style: AppTheme.darkTheme.textTheme.titleMedium?.copyWith(
                  color: Color(0xFFA7B1BC),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to see all coins page
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: Color(0xFF85D1F0)),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Color(0xFF20252B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: _coins.map((coin) {
                final ticker = _tickerData[coin.symbol];
                final isLoading = ticker == null;
                
                return CoinTile(
                  iconUrl: coin.iconUrl,
                  name: coin.name,
                  symbol: coin.ticker,
                  price: ticker?.price,
                  changePercent: ticker?.priceChangePercent,
                  isLoading: isLoading,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CoinConfig {
  final String symbol;
  final String name;
  final String ticker;
  final String iconUrl;

  CoinConfig({
    required this.symbol,
    required this.name,
    required this.ticker,
    required this.iconUrl,
  });
}