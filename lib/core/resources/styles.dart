import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

abstract class TextStyles {
  static TextStyle font24WhiteSemiBold = TextStyle(
    fontSize: 24.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 24.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );
}