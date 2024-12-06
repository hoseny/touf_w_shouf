import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/validate_otp/validate_otp_form.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/validate_otp/validate_otp_header.dart';

class ValidateOtpBody extends StatelessWidget {
  final String email;
  final String? phone;

  const ValidateOtpBody({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
      listener: (context, state) {
        if (state is ValidateOtpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ValidateOtpSuccess) {
          context.pop();
          ToastHelper.showSuccessToast(state.validateOtpResponse.otp);
          context.pushNamedAndRemoveUntil(Routes.loginView,  predicate: (route) => false);
        } else if (state is ValidateOtpFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ValidateOtpHeader(),
              ValidateOtpForm(email: email, phone: phone),
            ],
          ),
        );
      },
    );
  }
}
