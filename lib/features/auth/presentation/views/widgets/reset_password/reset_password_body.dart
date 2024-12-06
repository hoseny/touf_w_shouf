import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
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
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ResetPasswordSuccess) {
          context.pop();
          ToastHelper.showSuccessToast('Password Reset Successful');
          context.pushNamedAndRemoveUntil(Routes.loginView,
              predicate: (route) => false);
        } else if (state is ResetPasswordFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ResetPasswordHeader(),
              ResetPasswordForm(
                otp: otp,
                transNo: transNo,
                email: email,
              ),
            ],
          ),
        );
      },
    );
  }
}
