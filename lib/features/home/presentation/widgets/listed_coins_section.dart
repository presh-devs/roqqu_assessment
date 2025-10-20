import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';

class ListedCoinsSection extends StatelessWidget {
  const ListedCoinsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildCoinTile(
            'https://seeklogo.com/images/B/bitcoin-logo-D193D7D737-seeklogo.com.png',
            'Bitcoin',
            'BTC',
            '\$22,840',
            '-0.61%',
          ),
          const Divider(),
          _buildCoinTile(
            'https://seeklogo.com/images/E/ethereum-logo-EC6CDBA45B-seeklogo.com.png',
            'Ethereum',
            'ETH',
            '\$0.36',
            '-0.61%',
          ),
        ],
      ),
    );
  }

  Widget _buildCoinTile(
    String iconUrl,
    String name,
    String symbol,
    String price,
    String change,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.network(
        iconUrl,
        width: 40,
        height: 40,
        errorBuilder: (context, error, stackTrace) =>
            const CircleAvatar(radius: 20),
      ),
      title: Text(name, style: AppTheme.darkTheme.textTheme.bodyLarge),
      subtitle: Text(
        symbol,
        style: AppTheme.darkTheme.textTheme.bodySmall?.copyWith(
          color: Colors.grey,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(price, style: AppTheme.darkTheme.textTheme.bodyLarge),
          Text(
            change,
            style: AppTheme.darkTheme.textTheme.bodySmall?.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
