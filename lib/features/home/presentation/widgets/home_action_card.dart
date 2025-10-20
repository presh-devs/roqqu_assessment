import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/home_action_item.dart';

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF20252B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFF262932)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeActionItem(iconPath: Assets.deposit, label: 'Deposit'),
              HomeActionItem(iconPath: Assets.buy, label: 'Buy'),
              HomeActionItem(iconPath: Assets.withdraw, label: 'Withdraw'),
              HomeActionItem(iconPath: Assets.send, label: 'Sell'),
            ],
          ),
        ),
        Container(
          // color: const Color(0xFF20252B),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            border: Border.all(color: Color(0xFF262932)),
          ),
        
          child: TextButton(
            onPressed: () {},
            child: Text(
              'See More',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Color(0xFF85D1F0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
