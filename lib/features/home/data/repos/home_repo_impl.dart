import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/helpers/wish_list_service.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProgramModel>>> getActivePrograms() async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.packages,
      );
      final List<ProgramModel> programs =
          ProgramModel.fromJsonList(response['packages']);
      return Right(programs);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProgramModel>>> getDayUsePrograms() async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.dayUsePrograms,
      );
      final List<ProgramModel> programs =
          ProgramModel.fromJsonList(response['DayUse']);
      return Right(programs);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReservationModel>>> getPaidReservations() async {
    try {
      final int custCode = SharedPref.getInt(key: SharedPrefKeys.custCode)!;
      final response = await apiService.get(
        endpoint: ApiEndpoints.paidReservations(custCode: custCode.toString()),
      );
      final List<ReservationModel> paidReservations =
          ReservationModel.fromJsonList(response['CustomerPayment']);
      return Right(paidReservations);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReservationModel>>>
      getUnpaidReservations() async {
    try {
      final int custCode = SharedPref.getInt(key: SharedPrefKeys.custCode)!;
      final response = await apiService.get(
        endpoint:
            ApiEndpoints.unpaidReservations(custCode: custCode.toString()),
      );
      final List<ReservationModel> paidReservations =
          ReservationModel.fromJsonList(response['CustomerPayment']);
      return Right(paidReservations);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Voucher>> getVoucher({required String resNo}) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getVoucher(resNo: resNo),
      );
      final Voucher voucher = Voucher.fromJson(response['Voucher'][0]);
      return Right(voucher);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<String, List<ProgramModel>>> getWishList() async {
    try {
      final List<ProgramModel> myWishlist = await WishlistService.loadWishlist();
      return Right(myWishlist);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
