import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';

class ValidateOtpHeader extends StatelessWidget {
  const ValidateOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHeader(
      imageAsset: Assets.codevalid,
      title: 'Code validation',
      subtitle: 'Please enter the 6 digit code sent to your email',
    );
  }
}
