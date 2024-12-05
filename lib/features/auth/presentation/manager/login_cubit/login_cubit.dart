import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoading());
    final response = await authRepo.loginRequest(loginRequest: loginRequest);
    response.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (loginResponse) => emit(LoginSuccess(loginResponse)),
    );
  }
}
