import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/widgets/app_bar.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/success/success_body.dart';
class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Book Now'),
      body: SuccessBody(),
    );
  }
}
