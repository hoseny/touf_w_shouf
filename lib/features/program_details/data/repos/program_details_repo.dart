import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/program_details/data/models/insert_review/insert_review_success.dart';
import 'package:touf_w_shouf/features/program_details/data/models/photo_gallery_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/policy_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/review_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/insert_review/insert_review_request.dart';
import 'package:touf_w_shouf/features/program_details/data/models/supplements_model.dart';

abstract class ProgramDetailsRepo {
  Future<Either<Failure, ProgramDetailsModel>> getProgramDetails({
    required String programCode,
    required String programYear,
    required String lang,
  });

  Future<Either<Failure, List<SupplementsModel>>> getSupplements({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, List<PhotoGalleryModel>>> getPhotoGallery({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, List<ReviewModel>>> getReviews({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, InsertReviewResponse>> postCustReview({
    required String programCode,
    required String programYear,
    required InsertReviewRequest reviewRequest,
  });

  Future<Either<Failure, PolicyModel>> getPolicy({
    required String programCode,
    required String programYear,
    required String policyType,
  });
}
