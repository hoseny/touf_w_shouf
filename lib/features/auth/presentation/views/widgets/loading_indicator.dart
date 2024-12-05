import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryBlue,
      ),
    );
  }
}
