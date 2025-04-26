import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ContactUsTextField extends StatelessWidget {
  const ContactUsTextField({
    super.key,
    required this.hintText,
    this.maxLines,
    required this.title,
  });

  final String title;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(title, style: TextStyles.font16BlackMedium),
        TextFormField(
          maxLines: maxLines,
          cursorColor: AppColors.orange,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFAFAFA),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.orange),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xff747474),
              fontWeight: FontWeightHelper.regular,
            ),
            errorStyle: TextStyles.error,
            contentPadding: EdgeInsets.all(12.w),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isEnglish(context)
                  ? 'Please enter your review'
                  : 'يرجى ادخال تعليقك';
            }
            return null;
          },
          style: TextStyles.font16BlackRegular,
        ),
      ],
    );
  }
}
