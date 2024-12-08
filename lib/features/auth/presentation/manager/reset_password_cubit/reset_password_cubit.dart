import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/reset_password_models/reset_password_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    emit(ResetPasswordLoading());
    final response = await authRepo.resetPassword(
      resetPasswordRequest: resetPasswordRequest,
    );
    response.fold(
          (failure) => emit(ResetPasswordFailure(failure.message)),
          (resetPasswordResponse) => emit(ResetPasswordSuccess(resetPasswordResponse)),
    );
  }
}
