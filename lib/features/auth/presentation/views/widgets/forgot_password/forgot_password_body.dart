import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/forgot_password/forgot_password_form.dart';
class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
       children: [
         AuthHeader(
           imageAsset: Assets.forgetpass,
           title: 'Forgot password?',
           subtitle: 'Don’t worry! It’s happens. Please enter the email address associated with your account.',
           imageHeight: 328.89.h,
           titleSpacing: 12.h,
           subtitleSpacing: 8.h,
         ),
         20.verticalSpace,
         ForgotPasswordForm(),
       ],
      ),
    );
  }
}
