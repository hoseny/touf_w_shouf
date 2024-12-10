import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_step_indicator.dart';

import 'payment_method_tab_bar.dart';
class PaymentMethodBody extends StatelessWidget {
  const PaymentMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        AppProgramHeader(
          imageUrl: Assets.listExample,
          title: 'The Egyptian Gulf (Hospice of The Sultan)',
          rating: '4.5',
        ),
        PaymentStepIndicator(
          currentStep: 2,
        ),
        PaymentMethodTabBar(),
      ],
    );
  }
}