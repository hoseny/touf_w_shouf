import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

enum ButtonVariant { filled, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.variant = ButtonVariant.filled,
    this.width,
    this.height,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final ButtonVariant variant;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isFilled = variant == ButtonVariant.filled;

    return SizedBox(
      width: width ?? (isFilled ? double.infinity : 128.w),
      height: height ?? (isFilled ? 46.h : 20.h),
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isFilled ? backgroundColor ?? AppColors.primaryBlue : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isFilled ? 16.r : 0),
          ),
          padding: EdgeInsets.zero,
          elevation: isFilled ? 0 : null,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: isLoading
            ? CircularProgressIndicator(color: AppColors.white)
            : Text(
          text,
          style: isFilled
              ? TextStyles.font16WhiteMedium
              : TextStyles.font14Blue500Medium.copyWith(color: textColor ?? AppColors.primaryBlue),
        ),
      ),
    );
  }
}
