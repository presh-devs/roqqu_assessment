import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/home/data/datasources/binance_websocket_datasource.dart';
import 'package:roqqu_assessment/features/home/data/models/coin_config.dart';
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
  
  final Map<String, TickerModel> _tickerData = {};
 
  final List<CoinConfig> _coins = [
    CoinConfig(
      symbol: 'BTCUSDT',
      name: 'Bitcoin',
      ticker: 'BTC',
      iconUrl: Assets.btcIcon,
    ),
    CoinConfig(
      symbol: 'ETHUSDT',
      name: 'Ethereum',
      ticker: 'ETH',
      iconUrl: Assets.ethIcon,
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
    
    
    final symbols = _coins.map((c) => c.symbol).toList();
    

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
