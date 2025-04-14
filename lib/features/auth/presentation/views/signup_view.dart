import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_body.dart';
class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
        child: const SignupBody(),
      ),
    );
  }
}
