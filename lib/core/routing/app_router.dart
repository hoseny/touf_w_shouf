import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/routing/route_animations.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/home/views/home_view.dart';
import 'package:touf_w_shouf/features/onboarding/views/onboarding_view.dart';
import 'package:touf_w_shouf/features/onboarding/views/splash_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onboardingView:
        return RouteAnimations.buildPageRoute(
          page: const OnboardingView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      case Routes.homeView:
        return RouteAnimations.buildPageRoute(
          page: HomeView(),
          settings: settings,
          transitionType: TransitionType.slideFromRight,
        );
      default:
        return null;
    }
  }
}
