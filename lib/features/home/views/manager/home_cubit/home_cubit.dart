import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepoImpl homeRepo;

  Future<void> getActivePrograms() async {
    emit(ActiveProgramsLoading());
    final response = await homeRepo.getActivePrograms();
    response.fold(
      (failure) => emit(ActiveProgramsFailure(failure.message)),
      (programs) => emit(ActiveProgramsSuccess(programs)),
    );
  }
}
