import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/validations/regex_validation.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

import 'reset_password_validations.dart';

class ResetPasswordForm extends StatefulWidget {
  final String otp;
  final int transNo;
  final String email;

  const ResetPasswordForm({
    super.key,
    required this.otp,
    required this.transNo,
    required this.email,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmNewPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool minLength = false;
  bool hasNumber = false;
  bool hasSymbol = false;
  bool hasUppercase = false;
  bool hasLowercase = false;

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    newPassController.addListener(() {
      setState(() {
        hasLowercase = RegexValidation.hasLowerCase(newPassController.text);
        hasUppercase = RegexValidation.hasUpperCase(newPassController.text);
        hasNumber = RegexValidation.hasNumber(newPassController.text);
        minLength = RegexValidation.hasMinLength(newPassController.text);
        hasSymbol = RegexValidation.hasSpecialCharacter(newPassController.text);
      });
    });
  }

  @override
  void dispose() {
    newPassController.dispose();
    confirmNewPassController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (formKey.currentState!.validate()) {
      final newPassword = newPassController.text;
      final resetPasswordRequest = ResetPasswordRequest(
        otp: widget.otp,
        transactionNo: widget.transNo,
        email: widget.email,
        password: newPassword,
      );
      context.read<ResetPasswordCubit>().resetPassword(
            resetPasswordRequest: resetPasswordRequest,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: 380.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppTextFormField(
                  hintText: isEnglish(context)
                      ? "Enter new password"
                      : "كلمة المرور الجديدة",
                  controller: newPassController,
                  isPassword: true,
                  validator: (value) =>
                      Validation.passwordValidator(context, value),
                  onChanged: (value) => formKey.currentState!.validate(),
                ),
                3.verticalSpace,
                ResetPasswordValidations(
                  minLength: minLength,
                  hasNumber: hasNumber,
                  hasUppercase: hasUppercase,
                  hasLowercase: hasLowercase,
                  hasSymbol: hasSymbol,
                ),
                10.verticalSpace,
                AppTextFormField(
                  hintText: isEnglish(context)
                      ? "Confirm new password"
                      : "تأكيد كلمة المرور",
                  controller: confirmNewPassController,
                  isPassword: true,
                  validator: (value) => Validation.passwordConfirmValidator(
                    context,
                    value,
                    newPassController.text,
                  ),
                  onChanged: (value) => formKey.currentState!.validate(),
                ),
              ],
            ),
            10.verticalSpace,
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state is ResetPasswordLoading,
                  onPressed: _onSubmit,
                  text: isEnglish(context)
                      ? "Reset Password"
                      : "استعادة كلمة المرور",
                  width: 327.w,
                  height: 46.h,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
