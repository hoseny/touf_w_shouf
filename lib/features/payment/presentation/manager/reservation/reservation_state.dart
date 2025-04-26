part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationSuccess extends ReservationState {
  final ReservationResponse reservationResponse;

  ReservationSuccess({
    required this.reservationResponse,
  });
}

final class ReservationFailure extends ReservationState {
  final String errorMessage;

  ReservationFailure(this.errorMessage);
}
