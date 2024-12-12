import 'package:flutter/material.dart';

import 'page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.onPageChanged, required this.pageController});
  final PageController pageController;

  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: 3,
      itemBuilder: (context, index) {
        return PageViewItem(
          index: index,
        );
      },
    );
  }
}
