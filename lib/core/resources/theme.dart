import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat',
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.primaryBlue,
      selectionHandleColor: AppColors.primaryBlue,
      cursorColor: AppColors.primaryBlue,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
