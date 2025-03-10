import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/forgot_password_models/forgot_password_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());
  final AuthRepo authRepo;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<void> forgetPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    final response = await authRepo.forgetPassword(email: email);
    response.fold(
          (failure) => emit(ForgotPasswordFailure(failure.message)),
          (forgetPasswordResponse) => emit(ForgotPasswordSuccess(forgetPasswordResponse)),
    );
  }
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  enableAutoValidate() {
    autoValidateMode = AutovalidateMode.always;
    emit(UpdateAutoValidate());
  }
}
