
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabIndexUpdated(0));
  void updateIndex(int index) {
    if (index != (state as HomeTabIndexUpdated).index) {
      emit(HomeTabIndexUpdated(index));
    }
  }

}
