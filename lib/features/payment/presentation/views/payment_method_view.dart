import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/widgets/app_bar.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_method/payment_method_body.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Book Now'),
      body: PaymentMethodBody(),
    );
  }
}
