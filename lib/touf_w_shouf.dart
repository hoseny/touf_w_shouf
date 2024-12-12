import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/theme.dart';
import 'package:touf_w_shouf/core/routing/app_router.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';

class ToufWShouf extends StatelessWidget {
  const ToufWShouf({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRouter,
        initialRoute:
            SharedPref.getString(key: SharedPrefKeys.token).isNotNullOrEmpty()
                ? Routes.homeView
                : Routes.onboardingView,
        theme: AppTheme.theme,
      ),
    );
  }
}
