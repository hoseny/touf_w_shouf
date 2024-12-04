import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 620.h,
      left: 35.w,
      right: 35.w,
      child: Column(
        children: [
          Text(
            'Embark On Your Simple Travel Experience',
            style: TextStyles.onboardingTitleStyle,
            textAlign: TextAlign.center,
          ),
          10.verticalSpace,
          Text(
            'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
            style: TextStyles.onboardingDescriptionStyle,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
