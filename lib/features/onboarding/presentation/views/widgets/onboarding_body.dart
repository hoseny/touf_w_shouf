import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'onboarding_carousel.dart';
import 'onboarding_dots_indicator.dart';
import 'onboarding_navigation_buttons.dart';
import 'onboarding_text.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildOnboardingCarousel(),
        const OnboardingText(),
        _buildDotsIndicator(),
        _buildNavigationButtons(),
      ],
    );
  }

  Widget _buildOnboardingCarousel() {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPageNotifier,
      builder: (context, _, __) {
        return OnboardingCarousel(
          carouselController: _carouselController,
          onPageChanged: (index) {
            _currentPageNotifier.value = index;
          },
        );
      },
    );
  }

  Widget _buildDotsIndicator() {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPageNotifier,
      builder: (context, currentPage, _) {
        return OnboardingDotsIndicator(currentPage: currentPage);
      },
    );
  }

  Widget _buildNavigationButtons() {
    return OnboardingNavigationButtons(
      onNextPressed: () {
        _carouselController.nextPage();
      },
      onPreviousPressed: () {
        _carouselController.previousPage();
      },
    );
  }
}
