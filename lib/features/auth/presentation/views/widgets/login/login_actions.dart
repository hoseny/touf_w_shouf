import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_action_text.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.forgotPasswordView);
          },
          child: Text(
            "Forget Password?",
            style: TextStyles.font14Blue500Medium,
          ),
        ),
        AuthActionText(
          initialText: 'First time here?',
          actionText: 'Sign up for free',
          onActionTap: () {
            context.pushReplacementNamed(Routes.signUpView);
          },
        ),
      ],
    );
  }
}
