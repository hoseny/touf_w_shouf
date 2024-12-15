import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (bool? isChecked) {},
            activeColor: AppColors.orange,
            side: const BorderSide(
              color: AppColors.fadedGrey,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'I Accept Terms And Conditions and Cancellation policy ',
                    style: TextStyles.font18BlackRegular,
                  ),
                  TextSpan(
                    text: 'Read Terms and conditions',
                    style: TextStyles.font18DeepTealRegular,
                    recognizer: TapGestureRecognizer()..onTap = () {},
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
