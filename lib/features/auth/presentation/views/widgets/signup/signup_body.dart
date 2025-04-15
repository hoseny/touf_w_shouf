import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_action.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_buttons.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_form.dart';

import 'signup_header.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pushNamed(
            Routes.validateOtpView,
            arguments: {
              'email': cubit.emailController.text.trim(),
              'phone': cubit.phoneController.text.trim()
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
            const SignUpForm(),
            const SignupAction(),
            const SignUpButton(),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
