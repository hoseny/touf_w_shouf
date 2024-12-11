import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController reviewController;
  AutovalidateMode? autoValidateMode;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    reviewController = TextEditingController();
    autoValidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  void dispose() {
    reviewController.dispose();
    autoValidateMode = AutovalidateMode.disabled;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: TextFormField(
              maxLines: 5,
              controller: reviewController,
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
                hintText: 'Write your feedback',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xff747474),
                  fontWeight: FontWeightHelper.regular,
                ),
                errorStyle: TextStyles.error,
                contentPadding: EdgeInsets.all(12.w),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your review';
                }
                return null;
              },
              style: TextStyles.font16BlackRegular,
            ),
          ),
          16.verticalSpace,
          AppButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {

              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            text: 'Submit',
            backgroundColor: AppColors.orange,
            borderRadius: 4.r,
            width: 160.w,
          )
        ],
      ),
    );
  }
}
