import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ConfirmPaymentDataRow extends StatelessWidget {
  const ConfirmPaymentDataRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.font18FadedGreyMedium,
        ),
        Text(
          value,
          style: TextStyles.font18CharcoalGreyMedium,
        ),
      ],
    );
  }
}
