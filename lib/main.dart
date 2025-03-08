import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/helpers/bloc_observer.dart';
import 'package:touf_w_shouf/core/helpers/system_ui_config.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';
import 'package:touf_w_shouf/core/routing/app_router.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/touf_w_shouf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    DioFactory.initialize(),
    SharedPref.init(),
  ]);
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  SystemUIConfig.configure();
  runApp(
    ToufWShouf(
      appRouter: AppRouter(),
    ),
  );
}
