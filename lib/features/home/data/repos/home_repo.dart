import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProgramModel>>> getActivePrograms();

  Future<Either<Failure, List<ProgramModel>>> getDayUsePrograms();

  Future<Either<Failure, List<ReservationModel>>> getPaidReservations();

  Future<Either<Failure, List<ReservationModel>>> getUnpaidReservations();

  Future<Either<Failure, Voucher>> getVoucher({required String resNo});
}
