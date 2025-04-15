import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/reset_password/reset_password_validations.dart';

class ResetPasswordForm extends StatelessWidget {
  final String otp;
  final int transNo;
  final String email;

  const ResetPasswordForm({
    super.key,
    required this.otp,
    required this.transNo,
    required this.email,
  });

  void _onSubmit(BuildContext context, AuthCubit cubit) {
    if (cubit.formKey.currentState!.validate()) {
      final newPassword = cubit.newPassController.text;
      final resetPasswordRequest = ResetPasswordRequest(
        otp: otp,
        transactionNo: transNo,
        email: email,
        password: newPassword,
      );
      cubit.resetPassword(
        resetPasswordRequest: resetPasswordRequest,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.watch<AuthCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
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
                  controller: cubit.newPassController,
                  isPassword: true,
                  validator: (value) => Validation.passwordValidator(context, value),
                ),
                16.verticalSpace,
                BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) => current is SetupPasswordListener,
                  builder: (context, state) {
                    return ResetPasswordValidations(
                      minLength: cubit.minLength,
                      hasNumber: cubit.hasNumber,
                      hasUppercase: cubit.hasUppercase,
                      hasLowercase: cubit.hasLowercase,
                      hasSymbol: cubit.hasSymbol,
                    );
                  },
                ),
                10.verticalSpace,
                AppTextFormField(
                  hintText: isEnglish(context)
                      ? "Confirm new password"
                      : "تأكيد كلمة المرور",
                  controller: cubit.confirmNewPassController,
                  isPassword: true,
                  validator: (value) => Validation.passwordConfirmValidator(
                    context,
                    value,
                    cubit.newPassController.text,
                  ),
                ),
              ],
            ),
            AppButton(
              isLoading: cubit.state is ResetPasswordLoading,
              onPressed: () => _onSubmit(context, cubit),
              text: isEnglish(context) ? "Reset Password" : "استعادة كلمة المرور",
              width: 327.w,
              height: 46.h,
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
