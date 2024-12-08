import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'forgot_password_header.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          context.pop();
          ToastHelper.showSuccessToast(state.response.items.first.otp!);
          context.pushNamed(Routes.validateOtpView, arguments: {
            'email': emailController.text.trim(),
            'phone': null
          });
        } else if (state is ForgotPasswordFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const ForgotPasswordHeader(),
              ForgotPasswordForm(emailController: emailController),
            ],
          ),
        );
      },
    );
  }
}
