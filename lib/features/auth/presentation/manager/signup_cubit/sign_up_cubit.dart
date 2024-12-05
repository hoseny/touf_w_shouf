import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> signUp({required SignUpRequest signUpRequest}) async {
    emit(SignUpLoading());
    final response = await authRepo.signUpRequest(signUpRequest: signUpRequest);
    response.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (signUpResponse) => emit(SignUpSuccess(signUpResponse)),
    );
  }
}
