part of 'program_group_cubit.dart';

@immutable
sealed class ProgramGroupState {}

final class ProgramGroupInitial extends ProgramGroupState {}
final class ProgramGroupLoading extends ProgramGroupState {}
final class ProgramGroupSuccess extends ProgramGroupState {
  final ProgramGroup programGroup;
  final List<GroupPrice> groupPrice;

  ProgramGroupSuccess({required this.programGroup, required this.groupPrice});
}
final class ProgramGroupFailure extends ProgramGroupState {
  final String errorMessage;

  ProgramGroupFailure(this.errorMessage);

}
