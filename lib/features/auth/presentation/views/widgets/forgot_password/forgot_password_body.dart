import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'forgot_password_header.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          context.pop();
          ToastHelper.showSuccessToast(state.response.items.first.otp!);
          context.pushNamed(
            Routes.validateOtpView,
            arguments: {
              'email': cubit.emailController.text.trim(),
              'phone': null
            },
          );
        } else if (state is ForgotPasswordFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      child: const SingleChildScrollView(
        child: Column(
          children: [
            ForgotPasswordHeader(),
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
