part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class GroupLoading extends PaymentState {}

final class GroupSuccess extends PaymentState {
  final ProgramGroup programGroup;
  final List<GroupPrice> groupPrice;

  GroupSuccess({required this.programGroup, required this.groupPrice});
}

final class GroupFailure extends PaymentState {
  final String errorMessage;

  GroupFailure(this.errorMessage);
}
final class ReservationLoading extends PaymentState {}
final class ReservationSuccess extends PaymentState {
  final ReservationResponse response;

  ReservationSuccess(this.response);
}
final class ReservationFailure extends PaymentState {
  final String errorMessage;

  ReservationFailure(this.errorMessage);
}
