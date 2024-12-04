import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  const OnboardingDotsIndicator({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 748.h,
      child: AnimatedSmoothIndicator(
        activeIndex: currentPage,
        count: 3,
        effect: JumpingDotEffect(
          activeDotColor: Colors.white,
          dotHeight: 3.h,
          dotWidth: 17.w,
          spacing: 12.w,
          dotColor: AppColors.mutedGrey,
        ),
      ),
    );
  }
}
