import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/validations/regex_validation.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial()) {
    setupPasswordControllerListener();
  }

  final AuthRepo authRepo;
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmNewPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool minLength = false;
  bool hasNumber = false;
  bool hasSymbol = false;
  bool hasUppercase = false;
  bool hasLowercase = false;

  Future<void> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    emit(ResetPasswordLoading());
    final response = await authRepo.resetPassword(
      resetPasswordRequest: resetPasswordRequest,
    );
    response.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (resetPasswordResponse) =>
          emit(ResetPasswordSuccess(resetPasswordResponse)),
    );
  }

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
  enableAutoValidate() {
    autoValidateMode = AutovalidateMode.always;
    emit(UpdateAutoValidate());
  }
  @override
  Future<void> close() {
    newPassController.dispose();
    confirmNewPassController.dispose();
    return super.close();
  }
}
