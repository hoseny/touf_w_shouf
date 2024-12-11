import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'step_state.dart';

class StepCubit extends Cubit<StepStates> {
  StepCubit() : super(StepInitial(currentStep: 1));

  // Go to the next step
  void nextStep() {
    if (state is StepInitial || state is StepUpdated) {
      int current = (state as dynamic).currentStep;
      if (current < 3) {
        emit(StepUpdated(currentStep: current + 1));
      }
    }
  }

  // Go to the previous step
  void previousStep() {
    if (state is StepInitial || state is StepUpdated) {
      int current = (state as dynamic).currentStep;
      if (current > 1) {
        emit(StepUpdated(currentStep: current - 1));
      }
    }
  }

  // Jump to a specific step
  void goToStep(int step) {
    if (step >= 1 && step <= 3) {
      emit(StepUpdated(currentStep: step));
    }
  }
}
