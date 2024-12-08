import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/login_cubit/login_cubit.dart';

import 'login_actions.dart';
import 'login_form.dart';
import 'login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushNamedAndRemoveUntil(Routes.homeView, predicate: (route) => false);
          ToastHelper.showSuccessToast('Login Successfully');
        } else if (state is LoginFailure) {
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
              const LoginActions(),
            ],
          ),
        );
      },
    );
  }
}
