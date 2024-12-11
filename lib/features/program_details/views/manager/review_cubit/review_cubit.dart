
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/review_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.programDetailsRepo, this.program) : super(ReviewInitial());
  final ProgramDetailsRepoImpl programDetailsRepo;
  final ProgramModel program;

  Future<void> getReviews() async {
    emit(ReviewLoading());
    final result = await programDetailsRepo.getReviews(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
    );
    result.fold(
      (failure) => emit(ReviewFailure(failure.message)),
      (reviews) => emit(ReviewSuccess(reviews)),
    );
  }
}
