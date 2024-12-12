import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';

abstract class PaymentRepo {
  Future<Either<Failure,List<GroupPrice>>> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  });
}