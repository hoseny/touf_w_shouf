import 'package:flutter/material.dart';

enum TransitionType {
  slideFromBottom,
  slideFromLeft,
  slideFromRight,
  none,
}

class RouteAnimations {
  static PageRouteBuilder buildPageRoute({
    required Widget page,
    required RouteSettings settings,
    required TransitionType transitionType,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.slideFromBottom:
            return _buildSlideTransition(
              animation,
              child,
              beginOffset: const Offset(0, 1),
              curve: curve,
            );
          case TransitionType.slideFromLeft:
            return _buildSlideTransition(
              animation,
              child,
              beginOffset: const Offset(-1, 0),
              curve: curve,
            );
          case TransitionType.slideFromRight:
            return _buildSlideTransition(
              animation,
              child,
              beginOffset: const Offset(1, 0),
              curve: curve,
            );
          case TransitionType.none:
          default:
            return child;
        }
      },
    );
  }

  static Widget _buildSlideTransition(
    Animation<double> animation,
    Widget child, {
    required Offset beginOffset,
    Curve curve = Curves.easeInOut,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }
}
