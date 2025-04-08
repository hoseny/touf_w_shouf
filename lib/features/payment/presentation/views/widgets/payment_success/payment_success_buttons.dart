import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class PaymentSuccessButtons extends StatelessWidget {
  const PaymentSuccessButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        AppButton(
          onPressed: () {
            context.pushNamedAndRemoveUntil(
              predicate: (route) => false,
              Routes.homeView,
            );
          },
          text: isEnglish(context) ? 'Make another booking' : 'إجراء حجز آخر',
          width: 358.w,
          height: 42.h,
          backgroundColor: AppColors.orange,
          borderRadius: 12.r,
        ),
        AppButton(
          onPressed: () {
            context.pushNamedAndRemoveUntil(
              predicate: (route) => false,
              Routes.homeView,
            );
          },
          text: isEnglish(context) ? 'Return Home' : 'رجوع للرئيسية',
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
