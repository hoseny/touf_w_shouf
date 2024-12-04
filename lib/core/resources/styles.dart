import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class TextStyles {
  static const String _defaultFontFamily = 'Montserrat';

  /// Base method
  static TextStyle baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = AppColors.black,
    String fontFamily = _defaultFontFamily,
    double? height,
    TextDecoration decoration = TextDecoration.none,
    double? letterSpacing,
    double? wordSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      height: height,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle onboardingTitleStyle = baseStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Inter',
    color: AppColors.white,
    height: 29.05 / 24,
    letterSpacing: -0.3,
  );

  static TextStyle onboardingDescriptionStyle = baseStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Inter',
    color: AppColors.white,
    height: 19.36 / 16,
    letterSpacing: -0.3,
  );

  static TextStyle onboardingButtonStyle = baseStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Inter',
    color: AppColors.white,
  );

  /// Example: Common Text Styles
  static TextStyle font24WhiteSemiBold = baseStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );

  static TextStyle font16BlackRegular = baseStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );

  static TextStyle font18OrangeRegular = baseStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.orange,
  );


  /// Example: Buttons

}
