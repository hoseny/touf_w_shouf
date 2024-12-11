import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class PaymentMethodInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isObscure;

  const PaymentMethodInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.font16CharcoalGreySemiBold,
        ),
        5.verticalSpace,
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.font14Grey600Regular,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.ashGrey, width: 1.w),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
