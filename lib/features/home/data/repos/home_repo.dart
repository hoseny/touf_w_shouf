import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<ProgramModel>>> getActivePrograms();
}