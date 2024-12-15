import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_response.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.paymentRepoImpl) : super(CheckoutInitial());
  final PaymentRepoImpl paymentRepoImpl;

  Future<void> checkout({required CheckoutRequest request}) async {
    emit(CheckoutLoading());
    final result = await paymentRepoImpl.checkout(request: request);
    result.fold(
      (failure) => emit(CheckoutFailure(failure.message)),
      (checkout) => emit(CheckoutSuccess(checkout)),
    );
  }
}
