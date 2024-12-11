part of 'program_details_cubit.dart';

@immutable
sealed class ProgramDetailsState {}

final class ProgramDetailsInitial extends ProgramDetailsState {}

final class ProgramDetailsLoading extends ProgramDetailsState {}

final class ProgramDetailsSuccess extends ProgramDetailsState {
  final ProgramDetailsModel programDetails;
  final PolicyModel policyModel;

  ProgramDetailsSuccess(this.programDetails, this.policyModel);
}

final class ProgramDetailsFailure extends ProgramDetailsState {
  final String errorMessage;

  ProgramDetailsFailure(this.errorMessage);
}
