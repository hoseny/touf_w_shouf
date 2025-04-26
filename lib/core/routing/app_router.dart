import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/routing/args_model/sell_all_model.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/forgot_password_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/login_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/reset_password_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/signup_view.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/validate_otp_view.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/presentation/views/home_view.dart';
import 'package:touf_w_shouf/features/home/presentation/views/see_all_view.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/splash_view.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/payment_view.dart';
import 'package:touf_w_shouf/features/program_details/views/program_details_view.dart';


class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.signUpView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case Routes.forgotPasswordView:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordView());
      case Routes.resetPasswordView:
        final args = arguments as Map<String, dynamic>?;
        if (args != null &&
            args['email'] is String &&
            args['otp'] is String &&
            args['transNo'] is int) {
          return MaterialPageRoute(
            builder: (context) => ResetPasswordView(
              otpCode: args['otp'] as String,
              email: args['email'] as String,
              transNo: args['transNo'] as int,
            ),
          );
        }
        return null;
      case Routes.validateOtpView:
        if (arguments is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (context) => ValidateOtpView(
              email: arguments['email'] as String,
              phone: arguments['phone'] as String?,
            ),
          );
        }
        return null;
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.seeAllView:
        return MaterialPageRoute(
          builder: (context) => SeeAllView(
            seeAllModel: arguments as SeeAllModel,
          ),
        );
      case Routes.programDetailsView:
        if (arguments is ProgramModel) {
          return MaterialPageRoute(
            builder: (context) => ProgramDetailsView(program: arguments),
          );
        }
        return null;
      case Routes.paymentView:
        if (arguments is ProgramModel) {
          return MaterialPageRoute(
            builder: (context) => PaymentView(program: arguments),
          );
        }
        return null;
      default:
        return null;
    }
  }
}
