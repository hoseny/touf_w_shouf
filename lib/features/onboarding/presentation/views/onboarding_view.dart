import 'package:flutter/material.dart';
import 'widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OnboardingBody(),
    );
  }
}
