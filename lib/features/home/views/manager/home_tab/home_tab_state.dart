part of 'home_tab_cubit.dart';

@immutable
sealed class HomeTabState {}

final class HomeTabIndexUpdated extends HomeTabState {
  final int index;

  HomeTabIndexUpdated(this.index);
}
