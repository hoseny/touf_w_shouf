import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_button.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const OnboardingNavigationButtons({
    super.key,
    required this.onNextPressed,
    required this.onPreviousPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 775.h,
      left: 47.w,
      right: 47.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingButton(
            color: AppColors.mutedGrey,
            text: 'Skip',
            textStyle: TextStyles.onboardingButtonStyle,
            onTap: onPreviousPressed,
          ),
          16.horizontalSpace,
          OnboardingButton(
            color: AppColors.white,
            textStyle: TextStyles.onboardingButtonStyle.copyWith(color: AppColors.black),
            text: 'Next',
            onTap: onNextPressed,
          ),
        ],
      ),
    );
  }
}