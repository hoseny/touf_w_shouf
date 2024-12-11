import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return const AppProgramHeader(
      imageUrl: Assets.listExample,
      title: 'The Egyptian Gulf (Hospice of he Sultan)',
      rating: '4.5',
    );
  }
}
