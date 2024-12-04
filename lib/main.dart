import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/routing/app_router.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/touf_w_shouf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  runApp(
    ToufWShouf(
      appRouter: AppRouter(),
    ),
  );
}
