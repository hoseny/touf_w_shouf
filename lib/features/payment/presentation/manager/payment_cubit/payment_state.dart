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
