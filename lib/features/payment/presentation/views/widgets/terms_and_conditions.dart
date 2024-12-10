import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const TermsAndConditionsWidget({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onChanged(!isChecked);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 23.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.fadedGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(1.r)),
                  child: isChecked
                      ? Icon(
                          Icons.check,
                          size: 23.w,
                          color: AppColors
                              .orange, // Or another color for the checkmark
                        )
                      : null, // No content if not checked
                ),
                40.verticalSpace
              ],
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyles.font18BlackRegular,
                children: [
                  const TextSpan(
                      text:
                          'I Accept Terms And Conditions and Cancellation policy '),
                  TextSpan(
                    text: 'Read Terms and conditions',
                    style: TextStyles.font18DeepTealRegular,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Add logic to open terms and conditions
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
