import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  AuthHeader(
      imageAsset: Assets.resetpass,
      title: isEnglish(context) ? 'Reset password' : 'إعادة تعيين كلمة المرور',
      subtitle: '',
    );
  }
}
