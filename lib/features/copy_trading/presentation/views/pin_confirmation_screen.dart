import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';

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
        context.push('/transaction-success');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PIN Confirmation')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(backgroundColor),
                  border: Border.all(color: Color(borderColor)),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pinLength, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: _buildPinDot(index < _pin.length),
                    );
                  }),
                ),
              ),

              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(backgroundColor),
                  border: Border.all(color: Color(borderColor)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  Assets.biometrics,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const Spacer(),
          _buildNumPad(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot PIN?',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Color(0xFF85D1F0),
                fontWeight: FontWeight.w500,
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
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
    );
  }

  Widget _buildNumPad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNumButton('1'),
              _buildNumButton('2'),
              _buildNumButton('3'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNumButton('4'),
              _buildNumButton('5'),
              _buildNumButton('6'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNumButton('7'),
              _buildNumButton('8'),
              _buildNumButton('9'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumButton('.'),
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
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
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
        decoration: const BoxDecoration(color: Colors.transparent),
        child: const Center(
          child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
