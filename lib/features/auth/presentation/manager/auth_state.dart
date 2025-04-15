part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginResponse loginResponse;

  LoginSuccess(this.loginResponse);
}

final class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final SignUpResponse signUpResponse;

  SignUpSuccess(this.signUpResponse);
}

final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure(this.errMessage);
}

class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {
  final ForgotPasswordResponse response;

  ForgotPasswordSuccess(this.response);
}

class ForgotPasswordFailure extends AuthState {
  final String errMessage;

  ForgotPasswordFailure(this.errMessage);
}

final class ValidateOtpLoading extends AuthState {}

final class ValidateOtpSuccess extends AuthState {
  final ValidateOtpResponse validateOtpResponse;

  ValidateOtpSuccess(this.validateOtpResponse);
}

final class ValidateOtpFailure extends AuthState {
  final String errMessage;

  ValidateOtpFailure(this.errMessage);
}

final class ValidateOtpForgetLoading extends AuthState {}

final class ValidateOtpForgetSuccess extends AuthState {
  final ValidateOtpForgetResponse response;

  ValidateOtpForgetSuccess(this.response);
}

final class ValidateOtpForgetFailure extends AuthState {
  final String errorMessage;

  ValidateOtpForgetFailure(this.errorMessage);
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {
  final ResetPasswordResponse response;

  ResetPasswordSuccess(this.response);
}

final class ResetPasswordFailure extends AuthState {
  final String errorMessage;

  ResetPasswordFailure(this.errorMessage);
}

final class SetupPasswordListener extends AuthState {}
