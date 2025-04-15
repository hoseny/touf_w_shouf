import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'widgets/reset_password/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    super.key,
    required this.otpCode,
    required this.email,
    required this.transNo,
  });

  final String otpCode;
  final String email;
  final int transNo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<AuthRepo>(),
      )..setupPasswordControllerListener(),
      child: Scaffold(
        appBar: const AuthAppBar(),
        body: ResetPasswordBody(
          otp: otpCode,
          transNo: transNo,
          email: email,
        ),
      ),
    );
  }
}
