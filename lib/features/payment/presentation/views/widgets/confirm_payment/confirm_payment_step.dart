import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_buttons.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data.dart';

class ConfirmPaymentStep extends StatelessWidget {
  const ConfirmPaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.ultraLightWhite,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                const BoxShadow(
                  color: AppColors.ultraLightGrey,
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: const ConfirmPaymentData(),
          ),
          const ConfirmPaymentButtons(),
        ],
      ),
    );
  }
}
