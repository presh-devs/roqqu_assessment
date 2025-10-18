import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/risks_bottom_sheet.dart';

class ImportantMessageSheet extends StatefulWidget {
  const ImportantMessageSheet({super.key});

  @override
  State<ImportantMessageSheet> createState() => _ImportantMessageSheetState();
}
class _ImportantMessageSheetState extends State<ImportantMessageSheet> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),

     decoration: BoxDecoration(
       color: const Color(0xFF1C2127),
       border: Border.all(color: const Color(0xFF262932)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
     ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          SvgPicture.asset(
            Assets.importantMessage1,
            height: 120,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1D2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.info_outline,
                  size: 60,
                  color: Colors.purple,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Important message!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "Don't invest unless you're prepared and understand the risks involved in copy trading.\n",
                ),
                TextSpan(
                  text: 'Learn more',
                  style: TextStyle(
                    color: Color(0xFF6C5CE7),
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: ' about the risks.'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xFF6C5CE7);
                  }
                  return Colors.grey;
                }),
              ),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(text: 'Check this box to agree to Roquu\'s copy trading '),
                      TextSpan(
                        text: 'policy',
                        style: TextStyle(
                          color: Color(0xFF6C5CE7),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _isChecked ? const Color(0xFF3D4159) : const Color(0xFF2D3250),
              borderRadius: BorderRadius.circular(12),
               gradient: const LinearGradient(
          colors: [
            Color(0xFF483BEB),
            Color(0xFF7847E1),
            Color(0xFFDD568D),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
            ),
            child: ElevatedButton(
              onPressed: _isChecked
                  ? () {
                      Navigator.pop(context);
                      _showRisksBottomSheet(context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                disabledBackgroundColor: Colors.transparent,
                minimumSize: const Size(double.infinity, 50),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Proceed to copy trade',
                style: TextStyle(
                  color: _isChecked ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRisksBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const RisksBottomSheet(),
    );
  }
}
