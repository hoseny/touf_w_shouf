import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_buttons.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/payment_data_bloc_builder.dart';

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
          const PaymentDataBlocBuilder(),
          const ConfirmPaymentButtons(),
        ],
      ),
    );
  }
}

