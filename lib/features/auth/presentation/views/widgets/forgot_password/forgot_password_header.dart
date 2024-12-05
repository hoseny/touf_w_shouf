import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHeader(
      imageAsset: Assets.forgetpass,
      title: 'Forgot password?',
      subtitle:
      'Don’t worry! It happens. Please enter the email address associated with your account.',
      imageHeight: 328.89.h,
      titleSpacing: 12.h,
      subtitleSpacing: 8.h,
    );
  }
}
