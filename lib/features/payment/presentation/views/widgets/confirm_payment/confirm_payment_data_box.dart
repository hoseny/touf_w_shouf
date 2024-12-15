import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/features/payment/data/models/display_payment.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data.dart';

class ConfirmPaymentDataBox extends StatelessWidget {
  const ConfirmPaymentDataBox({
    super.key,
    required this.payment,
  });

  final DisplayPaymentModel payment;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ConfirmPaymentData(
        payment: payment,
      ),
    );
  }
}
