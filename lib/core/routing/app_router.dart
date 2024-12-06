import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/routing/route_animations.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/forgot_password_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/login_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/signup_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/validate_otp_view.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:touf_w_shouf/features/home/views/home_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingView:
        return RouteAnimations.buildPageRoute(
          page: const OnboardingView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      case Routes.loginView:
        return RouteAnimations.buildPageRoute(
          page: const LoginView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      case Routes.signUpView:
        return RouteAnimations.buildPageRoute(
          page: const SignupView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      case Routes.forgotPasswordView:
        return RouteAnimations.buildPageRoute(
          page: const ForgotPasswordView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      case Routes.validateOtpView:
      // Ensure that the arguments are properly passed
        if (arguments is Map<String, dynamic>) {
          final String email = arguments['email'];
          final String? phone = arguments['phone'];
          return RouteAnimations.buildPageRoute(
            page: ValidateOtpView(
              email: email,
              phone: phone,
            ),
            settings: settings,
            transitionType: TransitionType.slideFromBottom,
          );
        }
        return null; // Return null if no arguments or incorrect format
      case Routes.homeView:
        return RouteAnimations.buildPageRoute(
          page: const HomeView(),
          settings: settings,
          transitionType: TransitionType.slideFromRight,
        );
      default:
        return null;
    }
  }
}
