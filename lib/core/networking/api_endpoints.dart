import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';

abstract class ApiEndpoints {
  static const String baseUrl = 'https://app.misrtravelco.net:4444/ords/invoice/';
  static const String signUp = 'programes/client/';

  static String login({required LoginRequest loginRequest}) {
    return 'programes/ClientLogin/${loginRequest.email}/${loginRequest.password}';
  }

  static String forgetPassword({required String email}) {
    return 'programes/forgetPassword/$email';
  }

  static String validateOtpForget({required String email}) {
    return 'programes/forgetPassword/$email';
  }

  static String validateEmail({required String otp}) {
    return 'programes/validation/$otp';
  }

  static String resetPassword({required ResetPasswordRequest request}) {
    return 'programes/forgetPassword/${request.email}?V_OTP=${request.otp}&TransNo=${request.transactionNo}&pass=${request.password}';
  }

  static String packages = 'programes/Packages';
  static String dayUsePrograms = 'programes/programENG';

  static String programDetails({
    required String programCode,
    required String programYear,
    required String lang,
  }) {
    return 'programes/detailsesProgram/$programCode/$programYear/$lang';
  }

  static String supplements({
    required String programCode,
    required String programYear,
  }) {
    return 'programes//ProgramIncluding/$programCode/$programYear';
  }

  static String photoGallery({
    required String programCode,
    required String programYear,
  }) {
    return 'programes//Images/$programCode/$programYear';
  }

  static String reviews({
    required String programCode,
    required String programYear,
  }) {
    return 'programes//programReview/$programCode/$programYear';
  }

  static String insertReview({
    required String programCode,
    required String programYear,
  }) {
    return 'programes//programReview/$programCode/$programYear';
  }

  static String policy({
    required String programCode,
    required String programYear,
    required String policyType,
  }) {
    return 'programes/programpolicy/$programCode/$programYear/Cancel';
  }

  static String programGroup({
    required String programCode,
    required String programYear,
  }) {
    return 'programes/ProgramGroups/$programCode/$programYear';
  }

  static String groupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  }) {
    return 'programes/GroupPrice/$programCode/$programYear/$groupNumber';
  }

  static const String reservation = 'programes/Reservation/';
  static const String detailsReservation = 'programes/DetailsesRev/';

  static String displayPayment({
    required String refNo,
    required String ressp,
  }) {
    return 'programes/payment/$refNo/$ressp';
  }

  static String paidReservations({
    required String custCode,
  }) {
    return 'public/GetPayment?CustomerID=$custCode';
  }

  static String unpaidReservations({
    required String custCode,
  }) {
    return 'public/getReservation?CustomerID=$custCode';
  }
}
