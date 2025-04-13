import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/display_payment.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<ProgramGroup>>> getProgramGroup({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, List<GroupPrice>>> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  });

  Future<Either<Failure, ReservationResponse>> postReservation({
    required ReservationRequest request,
  });

  Future<Either<Failure, DetailsReservationResponse>> postDetailsReservation({
    required DetailsReservationRequest request,
  });

  Future<Either<Failure, DisplayPaymentModel>> getPayment({
    required String refNo,
    required String ressp,
  });

  Future<Either<Failure, CheckoutResponse>> checkout({
    required CheckoutRequest request,
  });
}
