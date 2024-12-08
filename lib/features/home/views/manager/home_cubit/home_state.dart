part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ActiveProgramsLoading extends HomeState {}

final class ActiveProgramsSuccess extends HomeState {
  final List<ProgramModel> programs;

  ActiveProgramsSuccess(this.programs);
}

final class ActiveProgramsFailure extends HomeState {
  final String errorMessage;

  ActiveProgramsFailure(this.errorMessage);
}
