import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_app_bar.dart';
import '../../../../core/di/service_locator.dart';
import '../manager/reset_password_cubit/reset_password_cubit.dart';
import 'widgets/reset_password/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.otpCode, required this.email, required this.transNo});
  final String otpCode;
  final String email;
  final int transNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(getIt.get<AuthRepo>()),
        child: ResetPasswordBody(otp: otpCode, transNo: transNo, email: email),
      ),
    );
  }
}
