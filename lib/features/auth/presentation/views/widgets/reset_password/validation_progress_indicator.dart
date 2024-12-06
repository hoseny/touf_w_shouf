import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class ValidationProgressIndicator extends StatelessWidget {
  final double percent;

  const ValidationProgressIndicator({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: LinearPercentIndicator(
        backgroundColor: AppColors.lightGrey,
        barRadius: Radius.circular(12.w),
        progressColor: _dynamicProgressColor(percent),
        percent: percent,
        animation: true,
        animateFromLastPercent: true,
      ),
    );
  }

  Color _dynamicProgressColor(double percent) {
    if (percent == 1) {
      return AppColors.success; // All criteria met
    } else if (percent >= 2 / 3) {
      return AppColors.yellow; // Two criteria met
    } else if (percent >= 1 / 3) {
      return AppColors.error; // One criterion met
    } else {
      return AppColors.lightGrey; // No criteria met
    }
  }
}
