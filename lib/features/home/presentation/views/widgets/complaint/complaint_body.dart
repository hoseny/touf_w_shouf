import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/contact_us/contact_us_text_field.dart';

class ComplaintBody extends StatelessWidget {
  const ComplaintBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 12.h,
        children: [
          Text(
            'Complaint and Suggestion',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: AppColors.orange,
            ),
          ),
          ContactUsTextField(
            hintText: isEnglish(context) ? 'Enter your Message' : 'اكتب تعليقك',
            maxLines: 5,
            title: isEnglish(context) ? 'Your Message' : 'تعليقك',
          ),
          AppButton(
            onPressed: () {},
            backgroundColor: AppColors.orange,
            text: 'Confirm',
          )
        ],
      ),
    );
  }
}
