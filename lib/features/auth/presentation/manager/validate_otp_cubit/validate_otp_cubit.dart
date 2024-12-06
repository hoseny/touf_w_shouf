import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  ValidateOtpCubit(this.authRepo) : super(ValidateOtpInitial());
  final AuthRepo authRepo;

  Future<void> validateOtp({
    required ValidateOtpRequest validateOtpRequest,
  }) async {
    emit(ValidateOtpLoading());
    final response = await authRepo.validateOtp(
        validateOtpRequest: validateOtpRequest
    );
    response.fold(
          (failure) => emit(ValidateOtpFailure(failure.message)),
          (validateOtpResponse) => emit(ValidateOtpSuccess(validateOtpResponse)),
    );
  }
}
