import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_action_text.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/signup/signup_form.dart';
class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthHeader(
            imageAsset: Assets.signup,
            title: 'Sign up',
            subtitle: 'Welcome back! Please enter your details.',
            imageHeight: 255.56.h,
            titleSpacing: 12.h,
            subtitleSpacing: 8.h,
          ),
          SignUpForm(),
          AuthActionText(
            initialText: 'Joined us before?',
            actionText: 'Login',
            onActionTap: () {
              context.pushNamed(Routes.loginView);
            },
          )
        ],
      ),
    );
  }
}
