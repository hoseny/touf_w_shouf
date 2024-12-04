import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class OnboardingSlideImages extends StatelessWidget {
  const OnboardingSlideImages({super.key, required this.index});

  final int index;

  static const List<String> images = [
    Assets.onboarding1,
    Assets.onboarding2,
    Assets.onboarding3,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          images[index],
          fit: BoxFit.cover,
        ),
        Container(
          color: AppColors.black.withOpacity(0.6),
        ),
      ],
    );
  }
}
