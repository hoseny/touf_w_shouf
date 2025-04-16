import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/insert_review/insert_review_request.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo.dart';
import 'program_details_state.dart';

class ProgramDetailsCubit extends Cubit<ProgramDetailsState> {
  ProgramDetailsCubit(this.programDetailsRepo, this.program) : super(const ProgramDetailsState());

  final ProgramDetailsRepo programDetailsRepo;
  final ProgramModel program;
  double userRating = 0;

  Future<void> getProgramDetails() async {
    emit(state.copyWith(programDetailsStatus: ProgramDetailsStatus.loading));

    final detailsResult = await programDetailsRepo.getProgramDetails(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
      lang: '1',
    );

    final policyResult = await programDetailsRepo.getPolicy(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
      policyType: 'Cancel',
    );

    detailsResult.fold(
      (failure) {
        emit(
          state.copyWith(
            programDetailsStatus: ProgramDetailsStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (details) {
        policyResult.fold(
          (failure) {
            emit(
              state.copyWith(
                programDetailsStatus: ProgramDetailsStatus.failure,
                errorMessage: failure.message,
              ),
            );
          },
          (policy) {
            emit(
              state.copyWith(
                programDetailsStatus: ProgramDetailsStatus.success,
                programDetails: details,
                policyModel: policy,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> getSupplements() async {
    emit(state.copyWith(supplementsStatus: SupplementsStatus.loading));

    final supplementsResult = await programDetailsRepo.getSupplements(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
    );

    supplementsResult.fold(
      (failure) {
        emit(
          state.copyWith(
            supplementsStatus: SupplementsStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (supplements) {
        emit(
          state.copyWith(
            supplementsStatus: SupplementsStatus.success,
            supplements: supplements,
          ),
        );
      },
    );
  }

  Future<void> getPhotoGallery() async {
    emit(state.copyWith(photoGalleryStatus: PhotoGalleryStatus.loading));

    final result = await programDetailsRepo.getPhotoGallery(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          photoGalleryStatus: PhotoGalleryStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (photoGallery) => emit(
        state.copyWith(
          photoGalleryStatus: PhotoGalleryStatus.success,
          photos: photoGallery,
        ),
      ),
    );
  }

  Future<void> getReviews() async {
    emit(state.copyWith(reviewStatus: ReviewStatus.loading));

    final result = await programDetailsRepo.getReviews(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          reviewStatus: ReviewStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (reviews) => emit(
        state.copyWith(
          reviewStatus: ReviewStatus.success,
          reviews: reviews,
        ),
      ),
    );
  }

  Future<void> insertReview(InsertReviewRequest reviewRequest) async {
    emit(state.copyWith(insertReviewStatus: InsertReviewStatus.loading));

    final result = await programDetailsRepo.postCustReview(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
      reviewRequest: reviewRequest,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          insertReviewStatus: InsertReviewStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          insertReviewStatus: InsertReviewStatus.success,
          insertReviewMessage: response.message,
        ),
      ),
    );
  }
}
