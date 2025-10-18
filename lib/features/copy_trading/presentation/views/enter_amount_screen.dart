import 'package:flutter/material.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/confirm_transaction_screen.dart';


class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  String _amount = '100';
  final double _balance = 240.73;
  final double _transactionFeePercent = 1.0;

  double get _transactionFee => double.parse(_amount.isEmpty ? '0' : _amount) * (_transactionFeePercent / 100);

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
      backgroundColor: const Color(0xFF1A1D2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Enter amount',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2D3250),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      '🇺🇸',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'USD',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            '$_amount USD',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Transaction fee ($_transactionFeePercent%) - ${_transactionFee.toStringAsFixed(2)}USD',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                TextButton(
                  onPressed: _useMax,
                  child: const Text(
                    'Use Max',
                    style: TextStyle(
                      color: Color(0xFF6C5CE7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C5CE7), Color(0xFFE91E63)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmTransactionScreen(amount: _amount),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildNumPad(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNumPad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              _buildNumButton('1', 'ABC'),
              const SizedBox(width: 8),
              _buildNumButton('2', 'ABC'),
              const SizedBox(width: 8),
              _buildNumButton('3', 'DEF'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildNumButton('4', 'GHI'),
              const SizedBox(width: 8),
              _buildNumButton('5', 'JKL'),
              const SizedBox(width: 8),
              _buildNumButton('6', 'MNO'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildNumButton('7', 'PQRS'),
              const SizedBox(width: 8),
              _buildNumButton('8', 'TUV'),
              const SizedBox(width: 8),
              _buildNumButton('9', 'WXYZ'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              const SizedBox(width: 8),
              _buildNumButton('0', ''),
              const SizedBox(width: 8),
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
            color: const Color(0xFF3D4159),
            borderRadius: BorderRadius.circular(12),
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
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
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
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF3D4159),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.backspace_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
