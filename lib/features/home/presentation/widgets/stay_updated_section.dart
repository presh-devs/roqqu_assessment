import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/app_theme.dart';
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
            style: AppTheme.darkTheme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3, // Example count
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 230, 228),
            child: Icon(Icons.notifications_active, color: Colors.red),
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
