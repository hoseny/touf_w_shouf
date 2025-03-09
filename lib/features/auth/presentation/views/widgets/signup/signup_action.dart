import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_action_text.dart';

class SignupAction extends StatelessWidget {
  const SignupAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthActionText(
      initialText: context.tr(LocaleKeys.authJoinedBefore),
      actionText: context.tr(LocaleKeys.authLogin),
      onActionTap: () {
        context.pushNamed(Routes.loginView,);
      },
    );
  }
}
