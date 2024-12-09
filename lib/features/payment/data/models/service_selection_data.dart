import 'package:flutter/material.dart';

class ServiceSelectionData {
  final String label;
  final String description;
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  ServiceSelectionData({
    required this.label,
    required this.description,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });
}
