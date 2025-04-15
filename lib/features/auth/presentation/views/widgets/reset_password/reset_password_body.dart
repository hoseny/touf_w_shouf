import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/reset_password/reset_password_form.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/reset_password/reset_password_header.dart';

class ResetPasswordBody extends StatelessWidget {
  final String otp;
  final int transNo;
  final String email;

  const ResetPasswordBody({
    super.key,
    required this.otp,
    required this.transNo,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordFailure,
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          context.pop();
          ToastHelper.showSuccessToast(isEnglish(context)
              ? 'Password Reset Successful'
              : 'تم تغيير كلمة المرور بنجاح');
          context.pushNamedAndRemoveUntil(
            Routes.loginView,
            predicate: (route) => false,
          );
        } else if (state is ResetPasswordFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errorMessage);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ResetPasswordHeader(),
            ResetPasswordForm(
              otp: otp,
              transNo: transNo,
              email: email,
            ),
          ],
        ),
      ),
    );
  }
}
