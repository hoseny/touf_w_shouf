import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this.repo) : super(ReservationInitial());
  final PaymentRepoImpl repo;

  Future<void> postReservation({
    required ReservationRequest request,
    required String paxType,
    required String paxCount,
    required String progGrpNo,
  }) async {
    emit(ReservationLoading());
    final reservationResult = await repo.postReservation(request: request);
    final reservation = reservationResult.fold(
      (failure) {
        emit(ReservationFailure(failure.message));
        return null;
      },
      (reservation) => reservation,
    );
    if (reservation == null) return;
    final detailsReservationResult = await repo.postDetailsReservation(
      request: DetailsReservationRequest(
        ressp: reservation.resSp.toString(),
        refNo: reservation.refNo.toString(),
        custRef: SharedPref.getInt(key: SharedPrefKeys.custCode).toString(),
        programCode: reservation.progCode,
        programYear: reservation.progYear,
        paxType: paxType,
        paxCount: paxCount,
        progGrpNo: progGrpNo,
      ),
    );
    final detailsReservation = detailsReservationResult.fold(
      (failure) {
        emit(ReservationFailure(failure.message));
        return null;
      },
      (detailsReservation) => detailsReservation,
    );
    if (detailsReservation == null) return;
    emit(
      ReservationSuccess(
        reservationResponse: reservation,
        detailsReservationResponse: detailsReservation,
      ),
    );
  }
}
