import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ValidateOtpPinPut extends StatelessWidget {
  final TextEditingController otpController;
  final void Function(String) onCompleted;
  const ValidateOtpPinPut({
    super.key,
    required this.otpController,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 54.w,
      height: 54.h,
      textStyle: TextStyles.font20BlackMedium,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: AppColors.primaryBlue,
        width: 1.4.w,
      ),
      borderRadius: BorderRadius.circular(14.r),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(14.r),
    );
    return Padding(
      padding: EdgeInsets.all(30.h),
      child: Pinput(
        controller: otpController,
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        errorPinTheme: errorPinTheme,
        onCompleted: (value) => onCompleted(value),
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "OTP cannot be empty!";
          } else if (value.length < 6) {
            return "Please enter a valid OTP";
          }
          return null;
        },
      ),
    );
  }
}
