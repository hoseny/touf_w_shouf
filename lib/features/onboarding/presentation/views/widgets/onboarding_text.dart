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
      bottom: 110.h,
      left: 20.w,
      right: 20.w,
      child: Column(
        children: [
          Text(
            'Embark On Your Simple Travel Experience',
            style: TextStyles.font24WhiteSemiBold,
            textAlign: TextAlign.center,
          ),
          6.verticalSpace,
          Text(
            'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
            style: TextStyles.font16WhiteRegular,
            textAlign: TextAlign.center,
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
