import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo_impl.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';
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
      appBar: AuthAppBar(),
      body: BlocProvider(
        create: (context) => ValidateOtpCubit(getIt.get<AuthRepoImpl>()),
        child: ValidateOtpBody(
          email: email,
          phone: phone,
        ),
      ),
    );
  }
}
