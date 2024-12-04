import 'package:flutter/material.dart';

/// Extension on BuildContext to simplify navigation calls
extension Navigation on BuildContext {
  /// Pushes a new route onto the stack using its name.
  ///
  /// [routeName]: The name of the route to navigate to.
  /// [arguments]: Optional arguments to pass to the new route.
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Replaces the current route with a new one using its name.
  ///
  /// [routeName]: The name of the route to navigate to.
  /// [arguments]: Optional arguments to pass to the new route.
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pushes a new route onto the stack and removes routes until a predicate is met.
  ///
  /// [routeName]: The name of the route to navigate to.
  /// [arguments]: Optional arguments to pass to the new route.
  /// [predicate]: A function to determine which routes to remove.
  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// Pops the top route off the navigation stack.
  void pop() => Navigator.of(this).pop();
}

/// Extension on nullable String to check if it is null or empty.
extension EmptyStringExtension on String? {
  /// Returns `true` if the string is null or empty.
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// Extension on nullable String to check if it is neither null nor empty.
extension NonEmptyStringExtension on String? {
  /// Returns `true` if the string is not null and not empty.
  bool isNotNullOrEmpty() => this != null && this!.isNotEmpty;
}
