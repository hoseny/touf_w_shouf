import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/validations/regex_validation.dart';
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

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial()) {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();
    newPassController = TextEditingController();
    confirmNewPassController = TextEditingController();
    otpController = TextEditingController();
  }

  final AuthRepo authRepo;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController firstnameController;
  late final TextEditingController lastnameController;
  late final TextEditingController phoneController;
  late final TextEditingController newPassController;
  late final TextEditingController confirmNewPassController;
  late final TextEditingController otpController;
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

  Future<void> forgetPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    final response = await authRepo.forgetPassword(email: email);
    response.fold(
      (failure) => emit(ForgotPasswordFailure(failure.message)),
      (forgetPasswordResponse) => emit(ForgotPasswordSuccess(forgetPasswordResponse)),
    );
  }

  Future<void> validateOtp({required ValidateOtpRequest validateOtpRequest}) async {
    emit(ValidateOtpLoading());
    final response = await authRepo.validateOtp(validateOtpRequest: validateOtpRequest);
    response.fold(
      (failure) => emit(ValidateOtpFailure(failure.message)),
      (validateOtpResponse) => emit(ValidateOtpSuccess(validateOtpResponse)),
    );
  }

  Future<void> validateOtpForget({required String email, required ValidateOtpForgetRequest request}) async {
    emit(ValidateOtpForgetLoading());
    final response = await authRepo.validateOtpForget(
      email: email,
      request: request,
    );
    response.fold(
      (failure) => emit(ValidateOtpForgetFailure(failure.message)),
      (validateOtpForgetResponse) => emit(ValidateOtpForgetSuccess(validateOtpForgetResponse)),
    );
  }

  Future<void> resetPassword({required ResetPasswordRequest resetPasswordRequest}) async {
    emit(ResetPasswordLoading());
    final response = await authRepo.resetPassword(
      resetPasswordRequest: resetPasswordRequest,
    );
    response.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (resetPasswordResponse) => emit(ResetPasswordSuccess(resetPasswordResponse)),
    );
  }

  bool minLength = false;
  bool hasNumber = false;
  bool hasSymbol = false;
  bool hasUppercase = false;
  bool hasLowercase = false;

  void setupPasswordControllerListener() {
    newPassController.addListener(() {
      emit(SetupPasswordListener());
      hasLowercase = RegexValidation.hasLowerCase(newPassController.text);
      hasUppercase = RegexValidation.hasUpperCase(newPassController.text);
      hasNumber = RegexValidation.hasNumber(newPassController.text);
      minLength = RegexValidation.hasMinLength(newPassController.text);
      hasSymbol = RegexValidation.hasSpecialCharacter(newPassController.text);
    });
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
    newPassController.dispose();
    confirmNewPassController.dispose();
    otpController.dispose();
    return super.close();
  }
}
