import 'package:flutter/material.dart';

enum TransitionType {
  slideFromBottom,
  slideFromLeft,
  slideFromRight,
  fadeThrough,
  fadeScale,
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
          case TransitionType.fadeThrough:
            return _buildFadeThroughTransition(animation, child, curve);
          case TransitionType.fadeScale:
            return _buildFadeScaleTransition(animation, child, curve);
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

  static Widget _buildFadeThroughTransition(
      Animation<double> animation,
      Widget child,
      Curve curve,
      ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: curve),
      child: child,
    );
  }

  static Widget _buildFadeScaleTransition(
      Animation<double> animation,
      Widget child,
      Curve curve,
      ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: curve),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: curve)),
        child: child,
      ),
    );
  }
}
