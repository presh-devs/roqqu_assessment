import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
import 'package:roqqu_assessment/core/constants/assests.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StayUpdatedSection extends StatefulWidget {
  const StayUpdatedSection({super.key});

  @override
  State<StayUpdatedSection> createState() => _StayUpdatedSectionState();
}

class _StayUpdatedSectionState extends State<StayUpdatedSection> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Stay Updated',
            style: AppTheme.darkTheme.textTheme.titleMedium?.copyWith(
              color: Color(0xFFA7B1BC),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildUpdateCard();
            },
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Color(0xFF1C2127),
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF20252B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF262932)),
      ),
      child: Row(
        children: [
           CircleAvatar(
            backgroundColor:Color(0xFF20252B),
            child: SvgPicture.asset(Assets.notificationIconWithAlert),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Delisting coins',
                    style: AppTheme.darkTheme.textTheme.labelLarge,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Urgent Notice',
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'View the list of coins we are delisting',
                style: AppTheme.darkTheme.textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
