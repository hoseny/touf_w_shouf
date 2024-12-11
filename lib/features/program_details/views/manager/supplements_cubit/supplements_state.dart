part of 'supplements_cubit.dart';

@immutable
sealed class SupplementsState {}

final class SupplementsInitial extends SupplementsState {}
final class SupplementsLoading extends SupplementsState {}
final class SupplementsSuccess extends SupplementsState {
  final List<SupplementsModel> supplements;

  SupplementsSuccess(this.supplements);
}
final class SupplementsFailure extends SupplementsState {
  final String errorMessage;

  SupplementsFailure(this.errorMessage);
}