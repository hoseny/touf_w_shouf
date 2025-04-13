import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log(
      '🟢 [onCreate] - ${bloc.runtimeType} created',
      name: 'App Bloc State',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (change.currentState != change.nextState) {
      log(
        '🔄 [onChange] - ${bloc.runtimeType} state changed: '
            'from ${change.currentState} ➡️ ${change.nextState}',
        name: 'App Bloc State',
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(
      '❌ [onError] - ${bloc.runtimeType} encountered error: $error',
      name: 'App Bloc State',
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log(
      '🔴 [onClose] - ${bloc.runtimeType} closed',
      name: 'App Bloc State',
    );
  }
}
