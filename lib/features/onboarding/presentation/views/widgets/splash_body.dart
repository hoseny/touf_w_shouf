import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  @override
  void initState() {
    super.initState();
    handleFirstLaunch();
  }

  Future<void> handleFirstLaunch() async {
    final isFirstLaunch = SharedPref.getBool(key: SharedPrefKeys.isFirstLaunch) ?? true;
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      isFirstLaunch
          ? context.pushReplacementNamed(Routes.onboardingView)
          : context.pushReplacementNamed(Routes.homeView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.splash,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
