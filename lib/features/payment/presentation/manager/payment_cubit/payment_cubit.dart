import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepoImpl paymentRepoImpl;

  List<GroupPrice> groupPrices = [];
  int totalPrice = 0;

  PaymentCubit(this.paymentRepoImpl) : super(PaymentInitial());

  Future<void> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  }) async {
    emit(GroupPriceLoading());
    final result = await paymentRepoImpl.getGroupPrice(
      programCode: programCode,
      programYear: programYear,
      groupNumber: groupNumber,
    );
    result.fold(
      (failure) => emit(GroupPriceFailure(failure.message)),
      (success) {
        groupPrices = success;
        emit(GroupPriceSuccess(groupPrices));
      },
    );
  }

  void increaseCount(int index) {
    if (groupPrices[index].count < 10) {
      groupPrices[index].count++;
      emit(GroupPriceSuccess(List.from(groupPrices)));
    }
  }

  void decreaseCount(int index) {
    if (groupPrices[index].count > 0) {
      groupPrices[index].count--;
      emit(GroupPriceSuccess(List.from(groupPrices)));
    }
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var pax in groupPrices) {
      totalPrice += pax.pPrice * pax.count;
    }
    return totalPrice;
  }

  Future<void> insertDetailsReservation({
    required DetailsReservationRequest detailsReservationRequest,
  }) async {
    emit(InsertDetailsReservationLoading());
    final result = await paymentRepoImpl.insertDetailsReservation(
      request: detailsReservationRequest,
    );
    result.fold(
      (failure) => emit(InsertDetailsReservationFailure(failure.message)),
      (success) => emit(InsertDetailsReservationSuccess(success)),
    );
  }
}
