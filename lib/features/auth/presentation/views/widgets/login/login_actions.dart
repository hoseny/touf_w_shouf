import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_action_text.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: "Forget Password?",
          onPressed: () {
            context.pushNamed(Routes.forgotPasswordView);
          },
          variant: ButtonVariant.text,
          width: 327.w,
          height: 38.h,
        ),
        AuthActionText(
          initialText: 'First time here?',
          actionText: 'Sign up for free',
          onActionTap: () {
            context.pushNamed(Routes.signUpView);
          },
        ),
      ],
    );
  }
}
