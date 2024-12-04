import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';

import 'login_form.dart';
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthHeader(
            imageAsset: 'assets/images/login.png',
            title: 'Login',
            subtitle: 'Welcome back! Please enter your details.',
            imageHeight: 255.56.h,
            titleSpacing: 12.h,
            subtitleSpacing: 8.h,
          ),
          LoginForm(),
      
      
        ],
      ),
    );
  }
}
