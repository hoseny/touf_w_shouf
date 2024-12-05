import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHeader(
      imageAsset: Assets.login,
      title: 'Login',
      subtitle: 'Welcome back! Please enter your details.',
      imageHeight: 255.56.h,
      titleSpacing: 12.h,
      subtitleSpacing: 8.h,
    );
  }
}
