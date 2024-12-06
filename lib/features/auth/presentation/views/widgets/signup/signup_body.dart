import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_form.dart';
import 'signup_header.dart';
import 'singnup_action.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key,});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            ),
          );
        } else if (state is SignUpSuccess) {
          context.pop();
          context.pushNamed(Routes.validateOtpView, arguments: {
            'email': emailController.text.trim(),
            'phone': phoneController.text.trim()
          });
          ToastHelper.showSuccessToast(state.signUpResponse.items.first.otp!);
        } else if (state is SignUpFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SignupHeader(),
              SignUpForm(
                emailController: emailController,
                phoneController: phoneController,
              ),
              SingnupAction(),
            ],
          ),
        );
      },
    );
  }
}
