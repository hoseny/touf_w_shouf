import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_forget_cubit/validate_otp_forget_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/validate_otp/validate_otp_form.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/validate_otp/validate_otp_header.dart';

class ValidateOtpBody extends StatelessWidget {
  final String email;
  final String? phone;

  final TextEditingController otpController = TextEditingController();

  ValidateOtpBody({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ValidateOtpCubit, ValidateOtpState>(
          listener: (context, state) {
            if (state is ValidateOtpSuccess) {
              context.pop();
              context.pushNamedAndRemoveUntil(
                Routes.loginView,
                predicate: (route) => false,
              );
              ToastHelper.showSuccessToast(
                isEnglish(context)
                    ? 'Verifying Successfully, Please login now'
                    : 'تحقق بنجاح، يرجى تسجيل الدخول الآن',
              );
            } else if (state is ValidateOtpFailure) {
              context.pop();
              ToastHelper.showErrorToast(state.errMessage);
            }
          },
        ),
        BlocListener<ValidateOtpForgetCubit, ValidateOtpForgetState>(
          listener: (context, state) {
            if (state is ValidateOtpForgetLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is ValidateOtpForgetSuccess) {
              context.pop();
              context.pushNamed(
                Routes.resetPasswordView,
                arguments: {
                  'email': email,
                  'otp': otpController.text,
                  'transNo': state.response.transactionNo,
                },
              );
              ToastHelper.showSuccessToast(
                isEnglish(context)
                    ? 'OTP verification successful for password reset'
                    : 'تم التحقق من OTP بنجاح لاستعادة كلمة المرور',
              );
            } else if (state is ValidateOtpForgetFailure) {
              context.pop();
              ToastHelper.showErrorToast(state.errorMessage);
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ValidateOtpHeader(),
            ValidateOtpForm(
              email: email,
              phone: phone,
              otpController: otpController,
            ),
          ],
        ),
      ),
    );
  }
}
