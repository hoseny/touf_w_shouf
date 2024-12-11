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
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
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