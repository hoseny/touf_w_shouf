import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';
import 'payment_form.dart';
import 'payment_step_indicator.dart';
import 'trip_date_time.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        AppProgramHeader(
          imageUrl: Assets.listExample,
          title: 'The Egyptian Gulf (Hospice of The Sultan)',
          rating: '4.5',
        ),
        PaymentStepIndicator(
          currentStep: 2,
        ),
        TripDateTimeWidget(
          tripDate: '2/3/2022',
          tripTime: '18:00',
        ),
        PaymentForm(),
      ],
    );
  }
}
