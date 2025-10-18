import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';

class PinConfirmationScreen extends StatefulWidget {
  const PinConfirmationScreen({super.key});

  @override
  State<PinConfirmationScreen> createState() => _PinConfirmationScreenState();
}

class _PinConfirmationScreenState extends State<PinConfirmationScreen> {
  String _pin = '';
  final int _pinLength = 6;

  void _onNumberPress(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin += number;
      });

      if (_pin.length == _pinLength) {
        // PIN complete - process transaction
        Future.delayed(const Duration(milliseconds: 500), () {
          _showSuccessDialog();
        });
      }
    }
  }

  void _onBackspace() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2D3250),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Transaction Successful!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your copy trade has been initiated',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: double.infinity,
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
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
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
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(Assets.pinCode, width: 100, height: 100),
          const SizedBox(height: 24),
          const Text(
            'Confirm Transaction',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Input your 6 digit transaction PIN to confirm your transaction and authenticate your request',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pinLength, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: _buildPinDot(index < _pin.length),
              );
            }),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: 40,
            ),
          ),
          const Spacer(),
          _buildNumPad(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot PIN?',
              style: TextStyle(
                color: Color(0xFF6C5CE7),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPinDot(bool filled) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? Colors.white : Colors.transparent,
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 2,
        ),
      ),
    );
  }

  Widget _buildNumPad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumButton('1'),
              _buildNumButton('2'),
              _buildNumButton('3'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumButton('4'),
              _buildNumButton('5'),
              _buildNumButton('6'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumButton('7'),
              _buildNumButton('8'),
              _buildNumButton('9'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 70),
              _buildNumButton('0'),
              _buildBackspaceButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumButton(String number) {
    return GestureDetector(
      onTap: () => _onNumberPress(number),
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: _onBackspace,
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}