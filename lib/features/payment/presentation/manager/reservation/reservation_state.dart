part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationSuccess extends ReservationState {
  final ReservationResponse reservationResponse;
  final DetailsReservationResponse detailsReservationResponse;

  ReservationSuccess({
    required this.reservationResponse,
    required this.detailsReservationResponse,
  });
}

final class ReservationFailure extends ReservationState {
  final String errorMessage;

  ReservationFailure(this.errorMessage);
}
