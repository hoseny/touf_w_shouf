import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepoImpl paymentRepoImpl;

  List<GroupPrice> groupPrices = [];
  int totalPrice = 0;
  int totalCount = 0;

  PaymentCubit(this.paymentRepoImpl) : super(PaymentInitial());

  Future<void> getGroup({
    required String programCode,
    required String programYear,
  }) async {
    emit(GroupLoading());
    final getProgramGroup = await paymentRepoImpl.getProgramGroup(
      programCode: programCode,
      programYear: programYear,
    );
    final programGroup = getProgramGroup.fold(
      (failure) {
        emit(GroupFailure(failure.message));
        return null;
      },
      (programGroup) => programGroup,
    );
    final getGroupPrice = await paymentRepoImpl.getGroupPrice(
      programCode: programCode,
      programYear: programYear,
      groupNumber: programGroup?.progGrpNo.toString() ?? '',
    );

    final groupPrices = getGroupPrice.fold(
      (failure) {
        emit(GroupFailure(failure.message));
        return null;
      },
      (groupPrice) => groupPrice,
    );
    if (programGroup != null && groupPrices != null) {
      this.groupPrices = groupPrices;
      emit(
        GroupSuccess(
          programGroup: programGroup,
          groupPrice: groupPrices,
        ),
      );
    }
  }

  void increaseCount(int index) {
    if (groupPrices[index].count < 10) {
      groupPrices[index].count++;
      emit(
        GroupSuccess(
          programGroup: (state as GroupSuccess).programGroup,
          groupPrice: List.from(groupPrices),
        ),
      );
    }
  }

  void decreaseCount(int index) {
    if (groupPrices[index].count > 0) {
      groupPrices[index].count--;
      emit(
        GroupSuccess(
          programGroup: (state as GroupSuccess).programGroup,
          groupPrice: List.from(groupPrices),
        ),
      );
    }
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var pax in groupPrices) {
      totalPrice += pax.pPrice * pax.count;
    }
    return totalPrice;
  }

  void calculateTotalCount() {
    for (var pax in groupPrices) {
      totalCount += pax.count;
    }
  }

  Future<void> insertReservation({
    required ReservationRequest reservationRequest,
  }) async {
    emit(ReservationLoading());
    final result = await paymentRepoImpl.insertDetailsReservation(
      request: reservationRequest,
    );
    result.fold(
      (failure) => emit(ReservationFailure(failure.message)),
      (success) => emit(ReservationSuccess(success)),
    );
  }
}
