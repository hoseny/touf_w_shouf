part of 'display_payment_cubit.dart';

@immutable
sealed class DisplayPaymentState {}

final class DisplayPaymentInitial extends DisplayPaymentState {}

final class DisplayPaymentLoading extends DisplayPaymentState {}

final class DisplayPaymentSuccess extends DisplayPaymentState {
  final DisplayPaymentModel paymentModel;

  DisplayPaymentSuccess(this.paymentModel);
}

final class DisplayPaymentFailure extends DisplayPaymentState {
  final String errorMessage;

  DisplayPaymentFailure(this.errorMessage);
}
