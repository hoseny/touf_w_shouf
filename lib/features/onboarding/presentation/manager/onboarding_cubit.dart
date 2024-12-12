import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);
  final PageController pageController = PageController();

  void goToNextPage() {
    emit(state + 1);
  }

  void setCurrentPage(int index) {
    emit(index);
  }
}
