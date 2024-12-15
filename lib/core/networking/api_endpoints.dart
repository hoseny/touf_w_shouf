import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';

abstract class ApiEndpoints {
  static const String baseUrl =
      'https://app.misrtravelco.net:4444/ords/invoice/programes/';
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

  static String resetPassword({required ResetPasswordRequest request}) {
    return 'forgetPassword/${request.email}?V_OTP=${request.otp}&TransNo=${request.transactionNo}&pass=${request.password}';
  }

  static const String packages = 'Packages';

  static String programDetails({
    required String programCode,
    required String programYear,
    required String lang,
  }) {
    return 'detailsesProgram/$programCode/$programYear/$lang';
  }

  static String supplements({
    required String programCode,
    required String programYear,
  }) {
    return '/ProgramIncluding/$programCode/$programYear';
  }

  static String photoGallery({
    required String programCode,
    required String programYear,
  }) {
    return '/Images/$programCode/$programYear';
  }

  static String reviews({
    required String programCode,
    required String programYear,
  }) {
    return '/programReview/$programCode/$programYear';
  }

  static String insertReview({
    required String programCode,
    required String programYear,
  }) {
    return '/programReview/$programCode/$programYear';
  }

  static String policy({
    required String programCode,
    required String programYear,
    required String policyType,
  }) {
    return 'programpolicy/$programCode/$programYear/Cancel';
  }

  static String programGroup({
    required String programCode,
    required String programYear,
  }) {
    return 'ProgramGroups/$programCode/$programYear';
  }

  static String groupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  }) {
    return 'GroupPrice/$programCode/$programYear/$groupNumber';
  }

  static const String reservation = 'Reservation/';
  static const String detailsReservation = 'DetailsesRev//';

  static String displayPayment({
    required String refNo,
    required String ressp,
  }) {
    return 'payment/$refNo/$ressp';
  }
}
