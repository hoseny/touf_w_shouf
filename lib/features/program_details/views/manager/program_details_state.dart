import 'package:touf_w_shouf/features/program_details/data/models/photo_gallery_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/supplements_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/review_model.dart';

enum ProgramDetailsStatus { initial, loading, success, failure }

enum SupplementsStatus { initial, loading, success, failure }

enum PhotoGalleryStatus { initial, loading, success, failure }

enum ReviewStatus { initial, loading, success, failure }

enum InsertReviewStatus { initial, loading, success, failure }

class ProgramDetailsState {
  // State for the main program details
  final ProgramDetailsStatus programDetailsStatus;
  final ProgramDetailsModel? programDetails;
  // State for supplements
  final SupplementsStatus supplementsStatus;
  final List<SupplementsModel>? supplements;

  // State for photo gallery
  final PhotoGalleryStatus photoGalleryStatus;
  final List<PhotoGalleryModel>? photos;

  // State for reviews
  final ReviewStatus reviewStatus;
  final List<ReviewModel>? reviews;

  // State for inserting review
  final InsertReviewStatus insertReviewStatus;
  final String insertReviewMessage;

  // General error message
  final String errorMessage;

  const ProgramDetailsState({
    this.programDetailsStatus = ProgramDetailsStatus.initial,
    this.programDetails,
    this.supplementsStatus = SupplementsStatus.initial,
    this.supplements,
    this.photoGalleryStatus = PhotoGalleryStatus.initial,
    this.photos,
    this.reviewStatus = ReviewStatus.initial,
    this.reviews,
    this.insertReviewStatus = InsertReviewStatus.initial,
    this.insertReviewMessage = '',
    this.errorMessage = '',
  });

  ProgramDetailsState copyWith({
    ProgramDetailsStatus? programDetailsStatus,
    ProgramDetailsModel? programDetails,
    SupplementsStatus? supplementsStatus,
    List<SupplementsModel>? supplements,
    PhotoGalleryStatus? photoGalleryStatus,
    List<PhotoGalleryModel>? photos,
    ReviewStatus? reviewStatus,
    List<ReviewModel>? reviews,
    InsertReviewStatus? insertReviewStatus,
    String? insertReviewMessage,
    String? errorMessage,
  }) {
    return ProgramDetailsState(
      programDetailsStatus: programDetailsStatus ?? this.programDetailsStatus,
      programDetails: programDetails ?? this.programDetails,
      supplementsStatus: supplementsStatus ?? this.supplementsStatus,
      supplements: supplements ?? this.supplements,
      photoGalleryStatus: photoGalleryStatus ?? this.photoGalleryStatus,
      photos: photos ?? this.photos,
      reviewStatus: reviewStatus ?? this.reviewStatus,
      reviews: reviews ?? this.reviews,
      insertReviewStatus: insertReviewStatus ?? this.insertReviewStatus,
      insertReviewMessage: insertReviewMessage ?? this.insertReviewMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
