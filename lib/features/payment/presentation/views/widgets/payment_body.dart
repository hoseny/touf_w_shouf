import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_steps.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/program_header.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_step_indicator.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ProgramHeader(),
        PaymentStepIndicator(),
        PaymentSteps(),
      ],
    );
  }
}
