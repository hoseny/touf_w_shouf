import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<int> {
  HomeTabCubit() : super(0);

  void updateTab(int index) {
    if (index != state) {
      emit(index);
    }
  }
}
