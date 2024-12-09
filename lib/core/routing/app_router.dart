import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/routing/route_animations.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/forgot_password_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/login_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/reset_password_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/signup_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/validate_otp_view.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/views/home_view.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:touf_w_shouf/features/program_details/views/program_details_view.dart';

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

      case Routes.resetPasswordView:
        final args = arguments as Map<String, dynamic>?;
        if (args != null &&
            args.containsKey('email') &&
            args.containsKey('otp') &&
            args.containsKey('transNo') &&
            args['email'] is String &&
            args['otp'] is String &&
            args['transNo'] is int) {
          final email = args['email'] as String;
          final otp = args['otp'] as String;
          final transNo = args['transNo'] as int;

          return RouteAnimations.buildPageRoute(
            page: ResetPasswordView(
              otpCode: otp,
              email: email,
              transNo: transNo,
            ),
            settings: settings,
            transitionType: TransitionType.slideFromBottom,
          );
        }
        return null;

      case Routes.validateOtpView:
        if (arguments is Map<String, dynamic>) {
          final email = arguments['email'] as String?;
          final phone = arguments['phone'] as String?;

          if (email != null) {
            return RouteAnimations.buildPageRoute(
              page: ValidateOtpView(
                email: email,
                phone: phone,
              ),
              settings: settings,
              transitionType: TransitionType.slideFromBottom,
            );
          }
        }
        return null;

      case Routes.homeView:
        return RouteAnimations.buildPageRoute(
          page: const HomeView(),
          settings: settings,
          transitionType: TransitionType.slideFromRight,
        );
      case Routes.programDetailsView:
        if (arguments is ProgramModel) {
          final program = arguments;
          return RouteAnimations.buildPageRoute(
            page: ProgramDetailsView(program: program),
            settings: settings,
            transitionType: TransitionType.slideFromRight,
          );
        } else {
          return null;
        }
      default:
        //Exit app
        return null;
    }
  }
}
