import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.isLoading = false,
    this.width,
    this.height,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final bool isLoading;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 46.h,
      child: TextButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.primaryBlue,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: AppColors.white)
            : Text(
          text,
          style: TextStyles.font16WhiteMedium,
        ),
      ),
    );
  }
}
