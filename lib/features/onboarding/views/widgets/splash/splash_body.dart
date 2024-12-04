import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: AppButton(
          onPressed: () {
            ToastHelper.showErrorToast('Connection timed out. Please check your internet and try again.');
          },
          text: 'Test',
          isLoading: false,

        ),
      ),
    );
  }
}
