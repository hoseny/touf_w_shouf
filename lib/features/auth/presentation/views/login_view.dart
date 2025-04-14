import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/login/login_body.dart';

import '../manager/login_cubit/login_cubit.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepo>()),
        child: const LoginBody(),
      ),
    );
  }
}
