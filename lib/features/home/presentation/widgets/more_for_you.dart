import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/features/home/presentation/widgets/more_list_item.dart';

class MoreForYou extends StatelessWidget {
  const MoreForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: const Color(0xFF20252B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trade',
                style: AppTheme.darkTheme.textTheme.titleMedium?.copyWith(
                  color: Color(0xFFA7B1BC),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF20252B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFF262932)),
                ),
                child: Column(
                  children: [
                    MoreListItem(title: 'Buy'),
                    MoreListItem(title: 'Sell'),
                    MoreListItem(title: 'Swap'),
                    MoreListItem(title: 'Send'),
                    MoreListItem(title: 'Recieve'),
                    MoreListItem(title: 'Invest', isNew: true,),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Earn',
                style: AppTheme.darkTheme.textTheme.titleMedium?.copyWith(
                  color: Color(0xFFA7B1BC),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF20252B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFF262932)),
                ),
                child: Column(
                  children: [
                    MoreListItem(title: "Roqq'n'roll", isNew: true,),
                    MoreListItem(title: 'Savings'),
                    MoreListItem(title: 'Savings'),
                    MoreListItem(title: 'Missions', isNew: true,),
                    MoreListItem(title: 'Copy trading', isNew: true,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
