import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'onboarding_slide_images.dart';

class OnboardingCarousel extends StatelessWidget {
  const OnboardingCarousel({
    super.key,
    required this.carouselController,
    required this.onPageChanged,
  });

  final CarouselSliderController? carouselController;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: OnboardingSlideImages.images.length,
      itemBuilder: (context, index, _) {
        return OnboardingSlideImages(index: index);
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
    );
  }
}
