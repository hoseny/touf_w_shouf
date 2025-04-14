import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/forgot_password/forgot_password_body.dart';
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(getIt.get<AuthRepo>()),
        child: const ForgotPasswordBody(),
      ),
    );
  }
}
