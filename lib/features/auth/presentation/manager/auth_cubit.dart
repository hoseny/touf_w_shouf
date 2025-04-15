import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial()) {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();
  }

  final AuthRepo authRepo;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController firstnameController;
  late final TextEditingController lastnameController;
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;
  bool isChecked = false;

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoading());
    final response = await authRepo.loginRequest(loginRequest: loginRequest);
    response.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (loginResponse) => emit(LoginSuccess(loginResponse)),
    );
  }

  Future<void> signUp({required SignUpRequest signUpRequest}) async {
    emit(SignUpLoading());
    final response = await authRepo.signUpRequest(signUpRequest: signUpRequest);
    response.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (signUpResponse) => emit(SignUpSuccess(signUpResponse)),
    );
  }

  void toggleCheckbox(bool value) {
    isChecked = value;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
