import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/features/program_details/data/models/insert_review/insert_review_success.dart';
import 'package:touf_w_shouf/features/program_details/data/models/photo_gallery_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/policy_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/review_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/insert_review/insert_review_request.dart';
import 'package:touf_w_shouf/features/program_details/data/models/supplements_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo.dart';

class ProgramDetailsRepoImpl extends ProgramDetailsRepo {
  final ApiService apiService;

  ProgramDetailsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ProgramDetailsModel>> getProgramDetails({
    required String programCode,
    required String programYear,
    required String lang,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.programDetails(
          programCode: programCode,
          programYear: programYear,
          lang: lang,
        ),
      );
      final programDetails =
          (response['items'] != null && response['items'].isNotEmpty)
              ? ProgramDetailsModel.fromJson(response['items'][0])
              : ProgramDetailsModel(
                  progCode: 0,
                  programName: 'Unknown Program',
                  programYear: 0,
                  startPrice: 0,
                  startDate: 'Not Available',
                  endDate: 'Not Available',
                  day: 0,
                  classTrip: 'Not Available',
                  city: 'Not Available',
                  overview: 'No overview available',
                  tourIncluding: 'No inclusions specified',
                  tourExcluding: 'No exclusions specified',
                );

      return Right(programDetails);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SupplementsModel>>> getSupplements({
    required String programCode,
    required String programYear,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.supplements(
          programCode: programCode,
          programYear: programYear,
        ),
      );
      final List<SupplementsModel> supplements = [];
      for (var supplement in response['items']) {
        supplements.add(SupplementsModel.fromJson(supplement));
      }
      return Right(supplements);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PhotoGalleryModel>>> getPhotoGallery({
    required String programCode,
    required String programYear,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.photoGallery(
          programCode: programCode,
          programYear: programYear,
        ),
      );
      final List<PhotoGalleryModel> photoGallery = [];
      for (var photo in response['items']) {
        photoGallery.add(PhotoGalleryModel.fromJson(photo));
      }
      return Right(photoGallery);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PolicyModel>> getPolicy({
    required String programCode,
    required String programYear,
    required String policyType,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.policy(
          programCode: programCode,
          programYear: programYear,
          policyType: policyType,
        ),
      );
      final policy = (response['items'] != null && response['items'].isNotEmpty)
          ? PolicyModel.fromJson(response['items'][0])
          : PolicyModel(
              policy: 'No Policy specified',
              code: 'No exclusions specified',
            );

      return Right(policy);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews({
    required String programCode,
    required String programYear,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.reviews(
          programCode: programCode,
          programYear: programYear,
        ),
      );
      final List<ReviewModel> reviews = [];
      for (var review in response['items']) {
        reviews.add(ReviewModel.fromJson(review));
      }
      return Right(reviews);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InsertReviewResponse>> postCustReview({
    required String programCode,
    required String programYear,
    required InsertReviewRequest reviewRequest,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.insertReview(
          programCode: programCode,
          programYear: programYear,
        ),
        data: reviewRequest.toJson(),
      );
      final review = InsertReviewResponse.fromJson(response);
      return Right(review);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
