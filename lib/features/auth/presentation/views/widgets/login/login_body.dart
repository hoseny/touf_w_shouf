import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/login/login_actions.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/login/login_form.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/login/login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pop();
          ToastHelper.showSuccessToast(context.tr(LocaleKeys.authLoginSuccess));
        } else if (state is LoginFailure) {
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      child: const SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),
            LoginForm(),
            LoginActions(),
          ],
        ),
      ),
    );
  }
}
