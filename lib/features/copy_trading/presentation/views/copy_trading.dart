import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/core/widgets/app_button.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/views/copy_trading_onboarding_page.dart';
import 'package:roqqu_assessment/features/copy_trading/presentation/widgets/bottom_bar.dart';

class CopyTradingScreen extends ConsumerStatefulWidget {
  const CopyTradingScreen({super.key});

  @override
  ConsumerState<CopyTradingScreen> createState() => _CopyTradingScreenState();
}

class _CopyTradingScreenState extends ConsumerState<CopyTradingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Map<String, String>> onboardingData = [
    {
      'image': Assets.copyProTraders1,
      'title': 'Copy PRO traders',
      'description':
          'Leverage expert strategies from professional traders to boost your trading results.',
    },
    {
      'image': Assets.doLessWinMore1,
      'title': 'Do less, Win more',
      'description':
          'Streamline your approach to trading and increase your winning potential effortlessly.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Copy trading',
      
        ),
      ),
        bottomNavigationBar: BottomBar(
          label: 'Get Started',
          onPressed: () => context.push('/copy-trading-engagement'),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            spacing: 16,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 2,
                        decoration: BoxDecoration(
                          color: _currentPage >= index
                              ? const Color(0xFF85D1F0)
                              : const Color(0xFF262932),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];
                    return CopyTradingOnboardingPage(
                      imagePath: item['image']!,
                      title: item['title']!,
                      description: item['description']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Watch a how to video',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    decoration: TextDecoration.none,
                    color: Color(0xFF85D1F0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
