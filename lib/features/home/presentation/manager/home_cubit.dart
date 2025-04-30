import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(const HomeState());
  final HomeRepo homeRepo;

  void updateTab(int index) {
    if (index != state.tabIndex) {
      emit(
        state.copyWith(
          tabIndex: index,
        ),
      );
    }
  }

  void updateReservationTab(int index) {
    if (index != state.reservationTabIndex) {
      emit(
        state.copyWith(
          reservationTabIndex: index,
        ),
      );
    }
  }

  Future<void> getActivePrograms() async {
    emit(
      state.copyWith(
        programsStatus: ProgramsStatus.loading,
      ),
    );
    final response = await homeRepo.getActivePrograms();
    response.fold(
      (failure) => emit(
        state.copyWith(
          programsStatus: ProgramsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (programs) => emit(
        state.copyWith(
          programsStatus: ProgramsStatus.success,
          programs: programs,
        ),
      ),
    );
  }

  Future<void> getDayUsePrograms() async {
    emit(
      state.copyWith(
        dayUseProgramStatus: DayUseProgramStatus.loading,
      ),
    );
    final response = await homeRepo.getDayUsePrograms();
    response.fold(
      (failure) => emit(
        state.copyWith(
          dayUseProgramStatus: DayUseProgramStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (dayUsePrograms) => emit(
        state.copyWith(
          dayUseProgramStatus: DayUseProgramStatus.success,
          dayUsePrograms: dayUsePrograms,
        ),
      ),
    );
  }

  Future<void> getPaidReservations() async {
    emit(
      state.copyWith(
        paidReservationStatus: PaidReservationStatus.loading,
      ),
    );
    final response = await homeRepo.getPaidReservations();
    response.fold(
      (failure) => emit(
        state.copyWith(
          paidReservationStatus: PaidReservationStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (paidReservations) => emit(
        state.copyWith(
          paidReservationStatus: PaidReservationStatus.success,
          paidReservations: paidReservations,
        ),
      ),
    );
  }

  Future<void> getUnpaidReservations() async {
    emit(
      state.copyWith(
        unPaidReservationStatus: UnPaidReservationStatus.loading,
      ),
    );
    final response = await homeRepo.getUnpaidReservations();
    response.fold(
      (failure) => emit(
        state.copyWith(
          unPaidReservationStatus: UnPaidReservationStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (unPaidReservations) => emit(
        state.copyWith(
          unPaidReservationStatus: UnPaidReservationStatus.success,
          unPaidReservations: unPaidReservations,
        ),
      ),
    );
  }

  Future<void> getWishList() async {
    emit(
      state.copyWith(
        wishListStatus: WishListStatus.loading,
      ),
    );
    final response = await homeRepo.getWishList();
    response.fold(
      (failure) => emit(
        state.copyWith(
          wishListStatus: WishListStatus.failure,
          errorMessage: failure,
        ),
      ),
      (wishList) => emit(
        state.copyWith(
          wishListStatus: WishListStatus.success,
          wishList: wishList,
        ),
      ),
    );
  }
}
