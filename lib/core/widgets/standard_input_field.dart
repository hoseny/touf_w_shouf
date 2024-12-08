import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class StandardInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;
  final bool isObscured;
  final VoidCallback togglePasswordVisibility;

  const StandardInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.autoValidateMode,
    required this.isObscured,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w, // Fixed width to maintain size
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscured,
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
            borderSide: BorderSide(color: AppColors.error, width: 1.w), // Error border
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
            borderSide: BorderSide(color: AppColors.error, width: 2.w), // Focused error border
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              isObscured
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.steelGrey,
            ),
            onPressed: togglePasswordVisibility,
          )
              : null,
        ),
        validator: validator,
        cursorColor: AppColors.black,
        onChanged: onChanged,
      ),
    );
  }
}
