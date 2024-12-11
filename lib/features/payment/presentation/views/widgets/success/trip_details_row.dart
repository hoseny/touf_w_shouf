import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
class TripDetailsRow extends StatelessWidget {
  final String label;
  final String value;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;

  const TripDetailsRow({
    super.key,
    required this.label,
    required this.value,
    this.mainAxisAlignment,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyles.font18FadedGreyMedium,),
        Text(value, style: textStyle ?? TextStyles.font18CharcoalGreyMedium),
      ],
    );
  }
}
