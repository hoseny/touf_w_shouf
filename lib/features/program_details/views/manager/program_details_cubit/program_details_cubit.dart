import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/policy_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';

part 'program_details_state.dart';

class ProgramDetailsCubit extends Cubit<ProgramDetailsState> {
  ProgramDetailsCubit(this.programDetailsRepo, this.program) : super(ProgramDetailsInitial());
  final ProgramDetailsRepoImpl programDetailsRepo;
  final ProgramModel program;

  Future<void> getProgramDetails() async {
    emit(ProgramDetailsLoading());

    final result = await programDetailsRepo.getProgramDetails(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
      lang: program.languageCode.toString(),
    );

    final policyResult = await programDetailsRepo.getPolicy(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
      policyType: 'Cancel',
    );

    final programDetails = result.fold(
      (failure) {
        emit(ProgramDetailsFailure(failure.message));
        return null;
      },
      (details) => details,
    );

    final policy = policyResult.fold(
      (failure) {
        emit(ProgramDetailsFailure(failure.message));
        return null;
      },
      (policy) => policy,
    );

    if (programDetails != null && policy != null) {
      emit(ProgramDetailsSuccess(programDetails, policy));
    }
  }
}
