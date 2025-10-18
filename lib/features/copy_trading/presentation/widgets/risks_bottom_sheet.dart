import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/widgets/app_button.dart';

class RisksBottomSheet extends StatefulWidget {
  const RisksBottomSheet({super.key});

  @override
  State<RisksBottomSheet> createState() => _RisksBottomSheetState();
}
class _RisksBottomSheetState extends State<RisksBottomSheet> {
  int? _expandedIndex;

  final List<Map<String, String>> _risks = [
    {
      'title': 'Market risks',
      'description': 'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Dependency on others',
      'description': 'You are relying on another trader\'s decisions and strategies.'
    },
    {
      'title': 'Mismatched risk profiles',
      'description': 'The trader\'s risk tolerance may not align with yours.'
    },
    {
      'title': 'Control and understanding',
      'description': 'You may have limited control and understanding of trades being executed.'
    },
    {
      'title': 'Emotional decisions',
      'description': 'Traders may make emotional decisions that impact your investment.'
    },
    {
      'title': 'Costs involved',
      'description': 'Copy trading may involve fees and commissions that reduce returns.'
    },
    {
      'title': 'Diversify',
      'description': 'Don\'t put all your capital in one strategy or trader.'
    },
    {
      'title': 'Execution risks',
      'description': 'Delays or errors in trade execution can occur.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
       color: Color(0xFF1C2127),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Risks involved in copy trading',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Please make sure you read the following risks involved in copy trading before making a decision.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _risks.length,
              itemBuilder: (context, index) {
                final isExpanded = _expandedIndex == index;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1D2E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        _risks[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onExpansionChanged: (expanded) {
                        setState(() {
                          _expandedIndex = expanded ? index : null;
                        });
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Text(
                            _risks[index]['description']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: AppButton(label:  'I have read the risks', onPressed: ()=> context.push('/enter-amount'),),
        )
        ],
      ),
    );
  }

}
