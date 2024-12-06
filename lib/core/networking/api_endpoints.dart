import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';

abstract class ApiEndpoints {
  static const String baseUrl = 'https://app.misrtravelco.net:4444/ords/invoice/programes/';
  static const String signUp = 'client/';

  static String login({required LoginRequest loginRequest}) {
    return 'ClientLogin/${loginRequest.email}/${loginRequest.password}';
  }

  static String forgetPassword({required String email}) {
    return 'forgetPassword/$email';
  }
  static String validateOtpForget({required String email}) {
    return 'forgetPassword/$email';
  }
  static String validateEmail({required String otp}) {
    return 'validation/$otp';
  }
  static String resetPassword() {
    return 'forgetPassword/:Email';
  }
}