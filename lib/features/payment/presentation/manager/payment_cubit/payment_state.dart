part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class GroupPriceLoading extends PaymentState {}

final class GroupPriceSuccess extends PaymentState {
  final List<GroupPrice> groupPrice;

  GroupPriceSuccess(this.groupPrice);
}

final class GroupPriceFailure extends PaymentState {
  final String errorMessage;

  GroupPriceFailure(this.errorMessage);
}
final class InsertDetailsReservationLoading extends PaymentState {}
final class InsertDetailsReservationSuccess extends PaymentState {
  final DetailsReservationResponse response;

  InsertDetailsReservationSuccess(this.response);
}
final class InsertDetailsReservationFailure extends PaymentState {
  final String errorMessage;

  InsertDetailsReservationFailure(this.errorMessage);
}
