import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/auth/data/models/forgot_password_models/forgot_password_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_forget_models/validate_otp_forget_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_forget_models/validate_otp_forget_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponse>> loginRequest({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.login(loginRequest: loginRequest),
      );
      final loginResponse = LoginResponse.fromJson(response['item'][0]);
      final token = loginResponse.token;
      final custCode = loginResponse.custCode;
      if (token.isNotEmpty) {
        await SharedPref.setData(
          key: SharedPrefKeys.token,
          value: token,
        );
        await SharedPref.setData(
          key: SharedPrefKeys.custCode,
          value: custCode,
        );
        DioFactory.setTokenIntoHeaderAfterLogin(token);
      } else {
        return Left(ServerFailure('Token is missing or invalid'));
      }
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignUpResponse>> signUpRequest({
    required SignUpRequest signUpRequest,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.signUp,
        data: signUpRequest.toJson(),
      );
      final signUpResponse = SignUpResponse.fromJson(response['item'][0]);
      return Right(signUpResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.forgetPassword(email: email),
      );
      final forgetPasswordResponse = ForgotPasswordResponse.fromJson(response);
      return Right(forgetPasswordResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ValidateOtpResponse>> validateOtp({
    required ValidateOtpRequest validateOtpRequest,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.validateEmail(otp: validateOtpRequest.otp),
        data: validateOtpRequest.toJson(),
      );
      final validateOtpResponse = ValidateOtpResponse.fromJson(response);
      return Right(validateOtpResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ValidateOtpForgetResponse>> validateOtpForget({
    required String email,
    required ValidateOtpForgetRequest request,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.validateOtpForget(email: email),
        data: request.toJson(),
      );
      final validateOtpForgetResponse = ValidateOtpForgetResponse.fromJson(response);
      return Right(validateOtpForgetResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    try {
      final response = await apiService.put(
        endpoint: ApiEndpoints.resetPassword(),
        data: resetPasswordRequest.toJson(),
      );
      final resetPasswordResponse = ResetPasswordResponse.fromJson(response);
      return Right(resetPasswordResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
