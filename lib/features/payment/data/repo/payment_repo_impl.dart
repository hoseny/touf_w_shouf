import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/display_payment.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/services_model.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final ApiService apiService;

  PaymentRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProgramGroup>>> getProgramGroup({
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
      final programGroup = ProgramGroup.fromJsonList(response['items']);
      return Right(programGroup);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServicesModel>> getGroupPrice({
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
      final services = ServicesModel.fromJson(response);
      return Right(services);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReservationResponse>> postReservation({
    required ReservationRequest request,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.reservation,
        data: request.toJson(),
      );
      final reservationResponse = ReservationResponse.fromJson(response);
      return Right(reservationResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, DetailsReservationResponse>> postDetailsReservation({
    required DetailsReservationRequest request,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: 'add_details/v1',
        contentType: Headers.jsonContentType,
        data: request.toJson(),
      );
      final detailsReservationResponse = DetailsReservationResponse.fromJson(response);
      return Right(detailsReservationResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DisplayPaymentModel>> getPayment({
    required String refNo,
    required String ressp,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.displayPayment(refNo: refNo, ressp: ressp),
      );
      final displayPaymentModel = DisplayPaymentModel.fromJson(response['items'][0]);
      return Right(displayPaymentModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CheckoutResponse>> checkout({
    required CheckoutRequest request,
  }) async {
    const String baseUrl = 'https://app.misrtravelco.net:4444/ords/invoice/public/';

    String checkout({
      required CheckoutRequest checkoutRequest,
    }) {
      return '$baseUrl'
          'GetCheckOut?urlFalse=${checkoutRequest.urlFalse}&'
          'accessType=${checkoutRequest.accessType}&'
          'urlTrue=${checkoutRequest.urlTrue}&'
          'custRef=${checkoutRequest.custRef}&'
          'invNo=${checkoutRequest.ressp}&'
          'invAmount=${checkoutRequest.totalPrice}&'
          'appSession=${checkoutRequest.token}';
    }

    try {
      final response = await apiService.get(
        endpoint: checkout(checkoutRequest: request),
      );
      final checkoutResponse = CheckoutResponse.fromJson(response);
      return Right(checkoutResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
