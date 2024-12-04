import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.text, this.backgroundColor, this.isLoading = false});

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? (){} : onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.w),
        ),
        elevation: 0,
        backgroundColor: backgroundColor ?? AppColors.orange,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 46.h),
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: AppColors.white)
          : Text(
              text,
              style: TextStyles.font16WhiteMedium,
            ),
    );
  }
}
