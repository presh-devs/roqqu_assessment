import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/core/widgets/app_button.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  String _amount = '100';
  final double _balance = 240.73;
  final double _transactionFeePercent = 1.0;

  double get _transactionFee =>
      double.parse(_amount.isEmpty ? '0' : _amount) *
      (_transactionFeePercent / 100);

  void _onNumberPress(String value) {
    setState(() {
      if (_amount == '0' || _amount.isEmpty) {
        _amount = value;
      } else {
        _amount += value;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_amount.isNotEmpty) {
        _amount = _amount.substring(0, _amount.length - 1);
      }
    });
  }

  void _onDecimal() {
    setState(() {
      if (!_amount.contains('.')) {
        _amount += '.';
      }
    });
  }

  void _useMax() {
    setState(() {
      _amount = _balance.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter amount'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF20252B),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xFF262932)),
            ),
            child: Row(
              children: [
                SvgPicture.asset(Assets.usFlag, height: 16, width: 16),
                const SizedBox(width: 6),
                const Text(
                  'USD',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 4),
                Transform.rotate(
                  angle: 3.14 / 2,
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              '$_amount USD',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
                fontFamily: 'Nexa-Heavy',
                height: 56/40
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Transaction fee ($_transactionFeePercent%) - ${_transactionFee.toStringAsFixed(2)}USD',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF20252B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF262932)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'USD Balance',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        '\$${_balance.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: _useMax,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A2F36),
                      padding: const EdgeInsets.only(
                        top: 3,
                        right: 10,
                        bottom: 3,
                        left: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Use Max',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              label: 'Continue',
              onPressed: () {
             context.push('/confirm-transaction', extra: _amount);
              },
            ),
            const SizedBox(height: 20),
            _buildNumPad(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNumPad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 6,
        children: [
          Row(
            spacing: 6,
            children: [
              _buildNumButton('1', ''),

              _buildNumButton('2', 'ABC'),

              _buildNumButton('3', 'DEF'),
            ],
          ),

          Row(
            spacing: 6,
            children: [
              _buildNumButton('4', 'GHI'),

              _buildNumButton('5', 'JKL'),

              _buildNumButton('6', 'MNO'),
            ],
          ),

          Row(
            spacing: 6,
            children: [
              _buildNumButton('7', 'PQRS'),

              _buildNumButton('8', 'TUV'),

              _buildNumButton('9', 'WXYZ'),
            ],
          ),

          Row(
            spacing: 6,
            children: [
              const Expanded(child: SizedBox()),

              _buildNumButton('0', ''),

              _buildBackspaceButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumButton(String number, String letters) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onNumberPress(number),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF434343),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Expanded(
      child: GestureDetector(
        onTap: _onBackspace,
        child: const Icon(
          Icons.backspace_outlined,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
