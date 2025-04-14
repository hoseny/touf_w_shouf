import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_state.dart';

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
}
