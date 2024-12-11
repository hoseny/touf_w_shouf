import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';

abstract class ProgramDetailsRepo {
  Future<Either<Failure, ProgramDetailsModel>> getProgramDetails(
      {required String programCode,
      required String programYear,
      required String lang});
}
