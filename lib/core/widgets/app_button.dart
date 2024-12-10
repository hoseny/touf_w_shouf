
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

enum ButtonVariant { filled, text, outlined } // Added 'outlined'

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
    this.borderRadius,
    this.style,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final ButtonVariant variant;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 46.h,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: variant == ButtonVariant.outlined
              ? Colors.transparent
              : backgroundColor ?? AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
            side: variant == ButtonVariant.outlined
                ? const BorderSide(
              color: AppColors.orange,
              width: 1,
            )
                : BorderSide.none,
          ),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: isLoading
            ? SizedBox(
          height: 30.h,
          width: 30.w,
          child: CircularProgressIndicator(
            color: AppColors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          text,
          style: style ?? TextStyles.font16WhiteMedium.copyWith(color: textColor),
        ),
      ),
    );
  }
}
