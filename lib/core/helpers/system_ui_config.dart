import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUIConfig {
  static void configure() {
    setSystemUIStyles();
    lockPortraitMode();
  }

  // the status bar at the top and bottom nav bar colors
  static void setSystemUIStyles() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  // disable device orientation
  static void lockPortraitMode() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}