import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

enum ProgramsStatus { initial, loading, success, failure }

class HomeState  {
  final int tabIndex;
  final String errorMessage;
  // Active programs States
  final ProgramsStatus programsStatus;
  final List<ProgramModel>? programs;

  const HomeState({
    this.tabIndex = 0,
    this.errorMessage = '',
    // Active programs States
    this.programsStatus = ProgramsStatus.initial,
    this.programs,
  });

  HomeState copyWith({
    int? tabIndex,
    String? errorMessage,
    // Active programs States
    ProgramsStatus? programsStatus,
    List<ProgramModel>? programs,
  }) {
    return HomeState(
      tabIndex: tabIndex ?? this.tabIndex,
      errorMessage: errorMessage ?? this.errorMessage,
      // Active programs States
      programsStatus: programsStatus ?? this.programsStatus,
      programs: programs ?? this.programs,
    );
  }
}