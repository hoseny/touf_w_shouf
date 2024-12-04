import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'country_picker_icon.dart';

class PhoneField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final String countryFlag;
  final VoidCallback showCountryPicker;
  final AutovalidateMode? autoValidateMode;

  const PhoneField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onChanged,
    required this.countryFlag,
    required this.showCountryPicker,
    this.autoValidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 46.h,
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
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
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
