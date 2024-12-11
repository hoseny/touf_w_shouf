part of 'step_cubit.dart';

@immutable
sealed class StepStates {
  const StepStates();
}

final class StepInitial extends StepStates {
  final int currentStep;

  const StepInitial({required this.currentStep});
}

final class StepUpdated extends StepStates {
  final int currentStep;

  const StepUpdated({required this.currentStep});
}
