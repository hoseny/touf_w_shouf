import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isChecked = false;

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
    phoneController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    return super.close();
  }

  enableAutoValidate() {
    autoValidateMode = AutovalidateMode.always;
    emit(UpdateAutoValidate());
  }
}
