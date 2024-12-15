import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/payment/data/models/display_payment.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'display_payment_state.dart';

class DisplayPaymentCubit extends Cubit<DisplayPaymentState> {
  DisplayPaymentCubit(this.paymentRepoImpl) : super(DisplayPaymentInitial());
  final PaymentRepoImpl paymentRepoImpl;

  Future<void> getPayment({
    required String refNo,
    required String ressp,
  }) async {
    emit(DisplayPaymentLoading());
    final result = await paymentRepoImpl.getPayment(
      refNo: refNo,
      ressp: ressp,
    );
    result.fold(
      (failure) => emit(DisplayPaymentFailure(failure.message)),
      (payment) => emit(DisplayPaymentSuccess(payment)),
    );
  }
}
