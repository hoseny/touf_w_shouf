import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_action.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_form.dart';

import 'signup_header.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({
    super.key,
  });

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pushNamed(
            Routes.validateOtpView,
            arguments: {
              'email': emailController.text.trim(),
              'phone': phoneController.text.trim()
            },
          );
          ToastHelper.showSuccessToast(state.signUpResponse.message);
        } else if (state is SignUpFailure) {
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SignupHeader(),
            SignUpForm(
              emailController: emailController,
              phoneController: phoneController,
            ),
            const SignupAction(),
          ],
        ),
      ),
    );
  }
}
