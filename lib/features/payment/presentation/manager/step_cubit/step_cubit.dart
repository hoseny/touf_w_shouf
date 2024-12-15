
import 'package:flutter_bloc/flutter_bloc.dart';

class StepCubit extends Cubit<int> {
  StepCubit() : super(0);

  void goToStep(int step) => emit(step);

  void nextStep() {
    if (state < 2) emit(state + 1);
  }

  void previousStep() {
    if (state > 0) emit(state - 1);
  }
}
