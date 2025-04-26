import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/services_model.dart';
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
    required List<AdditionalService> additionalServices,
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

    final String custRef = SharedPref.getInt(
      key: SharedPrefKeys.custCode,
    ).toString();
    final String refNo = reservation.refNo.toString();
    final int resSp = reservation.resSp;

    final reservationList = groupPrices
        .where((price) => price.count > 0)
        .map((price) => Reservation(
              paxType: price.pCategory,
              paxCount: price.count,
              ressp: resSp.toString(),
              refNo: refNo,
              custRef: custRef,
              code: program.code.toString(),
              year: program.programYear,
              progGrpNo: programGroup.progGrpNo.toString(),
            ))
        .toList();

    final additionalList = additionalServices
        .where((service) => service.count > 0)
        .map((service) => Additional(
              custRef: custRef,
              refNo: refNo,
              resSp: resSp,
              srvType: service.extSrv,
              paxType: service.pCategory,
              paxCount: service.count,
              itemRef: service.itemRef,
              code: program.code.toString(),
              year: program.programYear,
            ))
        .toList();

    final detailsRequest = DetailsReservationRequest(
      reservation: reservationList,
      additional: additionalList,
    );
    final detailsReservationResult = await repo.postDetailsReservation(
      request: detailsRequest,
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
