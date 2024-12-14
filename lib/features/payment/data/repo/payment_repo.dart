import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';

abstract class PaymentRepo {
  Future<Either<Failure, ProgramGroup>> getProgramGroup({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, List<GroupPrice>>> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  });

  Future<Either<Failure, ReservationResponse>> insertDetailsReservation({
    required ReservationRequest request,
  });
}
