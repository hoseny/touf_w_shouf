import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this.repo) : super(ReservationInitial());
  final PaymentRepoImpl repo;
  late ReservationResponse reservationResponse;

  Future<void> postReservation({
    required ReservationRequest request,
    required ProgramGroup programGroup,
    required List<GroupPrice> groupPrices,
    required ProgramModel program,
  }) async {
    emit(ReservationLoading());

    final reservationResult = await repo.postReservation(request: request);
    final reservation = reservationResult.fold(
      (failure) {
        emit(ReservationFailure(failure.message));
        return null;
      },
      (res) => res,
    );
    if (reservation == null) return;

    reservationResponse = reservation;

    final reservationList = groupPrices
        .where((price) => price.count > 0)
        .map((price) => Reservation(
              paxType: price.pCategory,
              paxCount: price.count,
              ressp: reservation.resSp.toString(),
              refNo: reservation.refNo.toString(),
              custRef: SharedPref.getInt(key: SharedPrefKeys.custCode).toString(),
              code: program.code.toString(),
              year: program.programYear,
              progGrpNo: programGroup.progGrpNo.toString(),
            ))
        .toList();


    final detailsReservationResult = await repo.postDetailsReservation(
      request: DetailsReservationRequest(
        reservation: reservationList,
      ),
    );

    final detailsReservation = detailsReservationResult.fold(
      (failure) {
        emit(ReservationFailure(failure.message));
        return null;
      },
      (res) => res,
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
