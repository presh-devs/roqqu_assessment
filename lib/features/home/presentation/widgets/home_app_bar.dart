import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Crypto', style: AppTheme.darkTheme.textTheme.titleMedium),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
      
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(Assets.headphones, width: 24, height: 24),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  Assets.notificationIcon,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.flagIcon, width: 24, height: 24),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
