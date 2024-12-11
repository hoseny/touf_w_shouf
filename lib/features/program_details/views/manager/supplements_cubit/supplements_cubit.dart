import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/supplements_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';

part 'supplements_state.dart';

class SupplementsCubit extends Cubit<SupplementsState> {
  SupplementsCubit(this.programDetailsRepo, this.program) : super(SupplementsInitial());
  final ProgramDetailsRepoImpl programDetailsRepo;
  final ProgramModel program;
  Future<void> getSupplements() async {
    emit(SupplementsLoading());
    final result = await programDetailsRepo.getSupplements(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
    );
    result.fold(
          (failure) => emit(SupplementsFailure(failure.message)),
          (supplements) => emit(SupplementsSuccess(supplements)),
    );
  }
}
