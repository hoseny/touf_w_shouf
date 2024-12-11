import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class FailureState extends StatelessWidget {
  const FailureState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: AppColors.error, size: 80.w),
        6.verticalSpace,
        Text(
          message,
          style: TextStyles.error,
          textAlign: TextAlign.center,
        ),
        12.verticalSpace,
        AppButton(
          onPressed: onRetry,
          text: 'Retry',
          backgroundColor: AppColors.error,
          width: 100.w,
          borderRadius: 6.r,
          style: TextStyles.font18WhiteSemiBold,
        ),
      ],
    );
  }
}
