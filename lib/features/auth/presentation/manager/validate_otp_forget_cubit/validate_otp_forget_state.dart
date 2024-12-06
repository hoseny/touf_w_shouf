part of 'validate_otp_forget_cubit.dart';

sealed class ValidateOtpForgetState {}

final class ValidateOtpForgetInitial extends ValidateOtpForgetState {}

final class ValidateOtpForgetLoading extends ValidateOtpForgetState {}

final class ValidateOtpForgetSuccess extends ValidateOtpForgetState {
  final ValidateOtpForgetResponse response;

  ValidateOtpForgetSuccess(this.response);
}

final class ValidateOtpForgetFailure extends ValidateOtpForgetState {
  final String errorMessage;

  ValidateOtpForgetFailure(this.errorMessage);
}
