import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
class PhoneInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final String countryFlag;
  final VoidCallback showCountryPicker;
  final AutovalidateMode? autoValidateMode;

  const PhoneInputField({
    super.key,
    required this.hintText,
     this.controller,
    this.validator,
    this.onChanged,
    required this.countryFlag,
    required this.showCountryPicker,
    this.autoValidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: TextFormField(
        autovalidateMode: autoValidateMode,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyles.font14Grey600Regular,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
            borderSide: BorderSide(color: AppColors.lightGrey, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
            borderSide: BorderSide(color: AppColors.primaryBlue, width: 2.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
            borderSide: BorderSide(color: AppColors.error, width: 2.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
            borderSide: BorderSide(color: AppColors.error, width: 2.w),
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
          prefixIcon: CountryPickerIcon(
            countryFlag: countryFlag,
            showCountryPicker: showCountryPicker,
          ),
        ),
        validator: validator,
        cursorColor: AppColors.black,
        keyboardType: TextInputType.phone,
        onChanged: onChanged,
      ),
    );
  }
}

class CountryPickerIcon extends StatelessWidget {
  final String countryFlag;
  final VoidCallback showCountryPicker;

  const CountryPickerIcon({super.key,
    required this.countryFlag,
    required this.showCountryPicker,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showCountryPicker,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              countryFlag,
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(width: 2.w),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: const Color(0xffB3BECD),
              size: 16.sp,
            ),
            SizedBox(width: 10.w),
            Container(
              width: 1,
              height: 30,
              color: AppColors.mediumGrey,
            ),
          ],
        ),
      ),
    );
  }
}
