import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_forget_cubit/validate_otp_forget_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/validate_otp/validate_otp_body.dart';

class ValidateOtpView extends StatelessWidget {
  final String email;
  final String? phone;

  const ValidateOtpView({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ValidateOtpCubit>(
            create: (context) => ValidateOtpCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider<ValidateOtpForgetCubit>(
            create: (context) => ValidateOtpForgetCubit(getIt.get<AuthRepo>()),
          ),
        ],
        child: ValidateOtpBody(
          email: email,
          phone: phone,
        ),
      ),
    );
  }
}
