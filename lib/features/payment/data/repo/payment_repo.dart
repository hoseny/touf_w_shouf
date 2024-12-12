import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<GroupPrice>>> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  });

  Future<Either<Failure, DetailsReservationResponse>> insertDetailsReservation({
    required DetailsReservationRequest request,
  });
}
