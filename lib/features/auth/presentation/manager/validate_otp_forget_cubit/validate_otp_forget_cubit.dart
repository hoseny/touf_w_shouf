import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_forget_models/validate_otp_forget_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_forget_models/validate_otp_forget_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'validate_otp_forget_state.dart';

class ValidateOtpForgetCubit extends Cubit<ValidateOtpForgetState> {
  ValidateOtpForgetCubit(this.authRepo) : super(ValidateOtpForgetInitial());
  final AuthRepo authRepo;

  Future<void> validateOtpForget({
    required String email,
    required ValidateOtpForgetRequest request,
  }) async {
    emit(ValidateOtpForgetLoading());
    final response = await authRepo.validateOtpForget(
      email: email,
      request: request,
    );
    response.fold(
          (failure) => emit(ValidateOtpForgetFailure(failure.message)),
          (validateOtpForgetResponse) =>
          emit(ValidateOtpForgetSuccess(validateOtpForgetResponse)),
    );
  }
}
