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
  static TextStyle font14Grey600Regular = baseStyle(
    fontSize: 14,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Grey600Medium = baseStyle(
    fontSize: 14,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Blue500Bold = baseStyle(
    fontSize: 14,
    color: AppColors.primaryBlue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14Grey700Medium = baseStyle(
    fontSize: 14,
    color: AppColors.slateGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Blue500Medium = baseStyle(
    fontSize: 14,
    color: AppColors.primaryBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Green500Medium = baseStyle(
      fontSize: 14,
      color: AppColors.success,
      fontWeight: FontWeightHelper.medium,
      );
  static TextStyle font14Grey500Medium = baseStyle(
    fontSize: 14,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20BlackMedium = baseStyle(
      fontSize: 20,
      color: AppColors.black,
      fontWeight: FontWeightHelper.medium,
      );

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
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );

  static TextStyle font18OrangeRegular = baseStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.orange,
  );
  static TextStyle font18OrangeMedium = baseStyle(
    fontSize: 18.sp,
    color: AppColors.orange,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font18WhiteMedium = baseStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font26GreyExtraBold = baseStyle(
    fontSize: 26.sp,
    color: AppColors.darkSlateGrey,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font14GreyMedium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.medium,
  );
}
