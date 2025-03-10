part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse response;

  ResetPasswordSuccess(this.response);
}

final class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordFailure(this.errorMessage);
}

final class SetupPasswordListener extends ResetPasswordState {}
final class UpdateAutoValidate extends ResetPasswordState {}
