import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState());
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
        programsLoading: true,
      ),
    );
    final response = await homeRepo.getActivePrograms();
    response.fold(
      (failure) => emit(
        state.copyWith(
          programsLoading: false,
          programsFailure: true,
          errorMessage: failure.message,
        ),
      ),
      (programs) => emit(
        state.copyWith(
          programsLoading: false,
          programsSuccess: true,
          programs: programs,
        ),
      ),
    );
  }
}
