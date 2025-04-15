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