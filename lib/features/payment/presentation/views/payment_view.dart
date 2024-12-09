import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/widgets/app_bar.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_body.dart';
class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Book Now'),
      body: PaymentBody(),
    );
  }
}
