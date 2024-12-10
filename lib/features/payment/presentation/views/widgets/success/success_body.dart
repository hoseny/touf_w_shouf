import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_step_indicator.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/success/success_buttons.dart';

import 'success_box.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key});

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
          currentStep: 3,
        ),
        SuccessBox(
          tripName: 'The Egyptian Gulf',
          bookingDate: '2/3/2022',
          tripDate: '2/3/2022 at 18:00',
          egyptiansNumber: '1',
          childrenNumber: '1',
          totalWithoutServices: '440 EGP',
          total: '440 EGP',
          vat: '17 EGP',
          totalWithVat: '457 EGP',
          cancellationDeadline: '10/3/2022',
        ),
        SuccessButtons(),
      ],
    );
  }
}
