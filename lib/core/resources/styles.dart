import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

abstract class TextStyles {
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
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Inter',
    color: AppColors.white,
    height: 29.05 / 24,
    letterSpacing: -0.3,
  );

  static TextStyle onboardingDescriptionStyle = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Inter',
    color: AppColors.white,
    height: 19.36 / 16,
    letterSpacing: -0.3,
  );

  static TextStyle onboardingButtonStyle = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Inter',
    color: AppColors.white,
  );

  /// Example: Common Text Styles
  static TextStyle font14Grey600Regular = baseStyle(
    fontSize: 14.sp,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font10mutedGreyRegular = baseStyle(
    fontSize: 10.sp,
    color: AppColors.mutedGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Grey600Medium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Blue500Bold = baseStyle(
    fontSize: 14.sp,
    color: AppColors.primaryBlue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14Grey700Medium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.slateGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Blue500Medium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.primaryBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Green500Medium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.success,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Grey500Medium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14GreyMedium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.steelGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14blackMedium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14FadedGreyMedium = baseStyle(
    fontSize: 14.sp,
    color: AppColors.fadedGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14deepTealRegular = baseStyle(
    fontSize: 14.sp,
    color: AppColors.deepTeal,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font20BlackMedium = baseStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20WhiteMedium = baseStyle(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font18WhiteRegular = baseStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18redMedium = baseStyle(
    fontSize: 16.sp,
    color: AppColors.error,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16BlackRegular = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );
  static TextStyle font18deepBlueSemiBold = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.deepTeal,
  );
  static TextStyle font16BlackMedium = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font16MutedGreyRegular = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.mutedGrey,
  );
  static TextStyle font16FadedGreyRegular = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.fadedGrey,
  );
  static TextStyle font16CharcoalGreyMedium = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.charcoalGrey,
  );
  static TextStyle font16FadedGreyMedium = baseStyle(
    fontSize: 16.sp,
    color: AppColors.fadedGrey,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font18MutedGreyMedium = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.mutedGrey,
  );
  static TextStyle font18FadedGreyMedium = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.fadedGrey,
  );
  static TextStyle font18CharcoalGreyMedium = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.charcoalGrey,
  );
  static TextStyle font18BlackMedium = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font19BlackMedium = baseStyle(
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font16OrangeSemiBold = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.orange,
  );
  static TextStyle font16CharcoalGreySemiBold = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.charcoalGrey,
  );
  static TextStyle font16WhiteMedium = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );
  static TextStyle font16WhiteRegular = baseStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.white,
  );

  static TextStyle font18OrangeRegular = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.orange,
  );
  static TextStyle font18CharcoalGreyRegular = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.charcoalGrey,
  );
  static TextStyle font18BlackRegular = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );
  static TextStyle font18DeepTealRegular = baseStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.deepTeal,
  );
  static TextStyle font18OrangeMedium = baseStyle(
    fontSize: 18.sp,
    color: AppColors.orange,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle error = baseStyle(
    fontSize: 18.sp,
    color: AppColors.error,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font18WhiteMedium = baseStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font18WhiteSemiBold = baseStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font18BlueSemiBold = baseStyle(
    fontSize: 18.sp,
    color: AppColors.primaryBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20OrangeMedium = baseStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.orange,
  );
  static TextStyle font24WhiteSemiBold = baseStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
  static TextStyle font24BlackMedium = baseStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font26GreyExtraBold = baseStyle(
    fontSize: 26.sp,
    color: AppColors.darkSlateGrey,
    fontWeight: FontWeightHelper.extraBold,
  );
}
