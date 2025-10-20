import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/bottom_bar.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  final String amount;

  const ConfirmTransactionScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final double amountValue = double.tryParse(amount) ?? 0;
    final double transactionFee = amountValue * 0.01;
    final double youGet = amountValue - transactionFee;

    return Scaffold(
      bottomNavigationBar: BottomBar(
        label: 'Confirm Transaction',
        onPressed: () => context.push('/pin-confirmation'),
      ),
      appBar: AppBar(title: const Text('Confirm transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF20252B),
                border: Border.all(color: const Color(0xFF262932)),
              
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child:  Center(
                      child: SvgPicture.asset(Assets.usFlag, fit: BoxFit.cover, height: 80, width: 80,),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Copy trading amount',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$amount USD',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'PRO trader',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            const Text(
                              'BTC master',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'What you get',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              '${youGet.toStringAsFixed(0)} USD',
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Transaction fee',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              '${transactionFee.toStringAsFixed(2)} USD',
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              
                  const SizedBox(height: 20),
                ],
              ),
            ),
          Spacer()
          ],
        ),
      ),
    );
  }
}
