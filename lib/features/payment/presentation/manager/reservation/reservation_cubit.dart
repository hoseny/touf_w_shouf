import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_response.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this.repo) : super(ReservationInitial());
  final PaymentRepoImpl repo;

  Future<void> postReservation({required ReservationRequest request}) async {
    emit(ReservationLoading());
    final response = await repo.postReservation(request: request);
    response.fold(
      (failure) => emit(ReservationFailure(failure.message)),
      (reservationResponse) => emit(ReservationSuccess(reservationResponse)),
    );
  }
}
