import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_header.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_step_indicator.dart';

import 'payment_method_tab_bar.dart';
class PaymentMethodBody extends StatelessWidget {
  const PaymentMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        PaymentHeader(),
        PaymentStepIndicator(
          currentStep: 2,
        ),
        PaymentMethodTabBar(),
      ],
    );
  }
}