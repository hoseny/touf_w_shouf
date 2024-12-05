import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_action_text.dart';
class SingnupAction extends StatelessWidget {
  const SingnupAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthActionText(
      initialText: 'Joined us before?',
      actionText: 'Login',
      onActionTap: () {
        context.pushNamedAndRemoveUntil(Routes.loginView, predicate: (route) => false);
      },
    );
  }
}