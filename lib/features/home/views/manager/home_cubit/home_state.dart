import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

class HomeState {
  final int tabIndex;
  final String errorMessage;

  // Active ProgramsState
  final bool programsLoading;
  final bool programsSuccess;
  final bool programsFailure;
  final List<ProgramModel>? programs;

  HomeState({
    this.tabIndex = 0,
    this.errorMessage = '',
    // Active Programs State
    this.programsLoading = false,
    this.programsSuccess = false,
    this.programsFailure = false,
    this.programs,
  });

  HomeState copyWith({
    int? tabIndex,
    String? errorMessage,
    // Active Programs State
    bool? programsLoading,
    bool? programsSuccess,
    bool? programsFailure,
    List<ProgramModel>? programs,
  }) {
    return HomeState(
      tabIndex: tabIndex ?? this.tabIndex,
      errorMessage: errorMessage ?? this.errorMessage,
      // Active Programs State
      programsLoading: programsLoading ?? this.programsLoading,
      programsSuccess: programsSuccess ?? this.programsSuccess,
      programsFailure: programsFailure ?? this.programsFailure,
      programs: programs ?? this.programs,
    );
  }
}
