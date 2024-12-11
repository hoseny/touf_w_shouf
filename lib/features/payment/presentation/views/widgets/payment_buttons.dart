import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class PaymentButtons extends StatelessWidget {
  final VoidCallback onPayPressed;
  final VoidCallback onAddToCartPressed;

  const PaymentButtons({
    super.key,
    required VoidCallback? onPayPressed,
    required VoidCallback? onAddToCartPressed,
  })  : onPayPressed = onPayPressed ?? _defaultCallback,
        onAddToCartPressed = onAddToCartPressed ?? _defaultCallback;

  static void _defaultCallback() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          onPressed: onPayPressed,
          text: 'Pay',
          width: 358.w,
          height: 42.h,
          backgroundColor: AppColors.orange,
          borderRadius: 12.r,
        ),
        20.verticalSpace,
        AppButton(
          onPressed: onAddToCartPressed,
          text: 'Add to my shopping cart',
          width: 358.w,
          height: 42.h,
          borderRadius: 12.r,
          backgroundColor: AppColors.orange,
          variant: ButtonVariant.outlined,
          textColor: AppColors.orange,
        ),
      ],
    );
  }
}
