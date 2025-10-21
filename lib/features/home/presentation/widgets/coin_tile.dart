import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.iconUrl,
    required this.name,
    required this.symbol,
    this.price,
    this.changePercent,
    this.isLoading = false,
  });

  final String iconUrl;
  final String name;
  final String symbol;
  final double? price;
  final double? changePercent;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isPositive = (changePercent ?? 0) >= 0;
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    final changeColor = isPositive ? const Color(0xFF00C087) : const Color(0xFFF04438);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF262932), width: 1),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          iconUrl,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) =>
              const CircleAvatar(radius: 20),
        ),
        title: Text(
          name,
          style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          symbol,
          style: AppTheme.darkTheme.textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
        trailing: isLoading
            ? SizedBox(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262932),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 50,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262932),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatter.format(price ?? 0),
                    style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${isPositive ? '+' : ''}${(changePercent ?? 0).toStringAsFixed(2)}%',
                    style: AppTheme.darkTheme.textTheme.bodySmall?.copyWith(
                      color: changeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}