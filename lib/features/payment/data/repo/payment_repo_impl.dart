import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final ApiService apiService;

  PaymentRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ProgramGroup>> getProgramGroup({
    required String programCode,
    required String programYear,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.programGroup(
          programCode: programCode,
          programYear: programYear,
        ),
      );
      final programGroup = ProgramGroup.fromJson(response['items'][0]);
      return Right(programGroup);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GroupPrice>>> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.groupPrice(
          programCode: programCode,
          programYear: programYear,
          groupNumber: groupNumber,
        ),
      );
      final List<GroupPrice> groupPrice = [];
      for (var pax in response['items']) {
        groupPrice.add(GroupPrice.fromJson(pax));
      }
      return Right(groupPrice);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReservationResponse>> insertDetailsReservation({
    required ReservationRequest request,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.reservation,
        data: request.toJson(),
      );
      final detailsReservationResponse = ReservationResponse.fromJson(response);
      return Right(detailsReservationResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
