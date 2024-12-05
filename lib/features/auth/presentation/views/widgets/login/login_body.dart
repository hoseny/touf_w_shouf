import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'login_actions.dart';
import 'login_form.dart';
import 'login_header.dart';
import 'login_loading_indicator.dart';
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const LoginLoadingIndicator(),
          );
        } else if (state is LoginSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.homeView, predicate: (route) => false);
          ToastHelper.showErrorToast('success');
        } else if (state is LoginFailure) {
          context.pop();
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
