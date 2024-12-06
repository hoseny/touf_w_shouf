import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/auth/data/models/forgot_password_models/forgot_password_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginRequest loginRequest});

  Future<Either<Failure, SignUpResponse>> signUpRequest(
      {required SignUpRequest signUpRequest});

  Future<Either<Failure, ForgotPasswordResponse>> forgetPassword(
      {required String email});

  Future<Either<Failure, ValidateOtpResponse>> validateOtp({
    required ValidateOtpRequest validateOtpRequest,
  });
}
