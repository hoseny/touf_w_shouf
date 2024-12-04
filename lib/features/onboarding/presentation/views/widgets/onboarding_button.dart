import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
  }) : super(key: key);

  final Color color;
  final String text;
  final void Function() onTap;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 140.w,
        height: height ?? 37.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ?? TextStyles.font16BlackRegular,
          ),
        ),
      ),
    );
  }
}
