import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class LoginLoadingIndicator extends StatelessWidget {
  const LoginLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryBlue,
      ),
    );
  }
}
