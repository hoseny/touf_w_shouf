import 'package:flutter/material.dart';
import 'payment_form.dart';
import 'payment_header.dart';
import 'payment_step_indicator.dart';
import 'trip_date_time.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({super.key});
  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        PaymentHeader(),
        PaymentStepIndicator(
          currentStep: 1,
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
