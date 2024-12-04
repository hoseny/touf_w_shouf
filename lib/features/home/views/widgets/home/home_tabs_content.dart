import 'package:flutter/material.dart';

class HomeTabContent extends StatelessWidget {
  final int index;

  const HomeTabContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const Text('Outings Tab Content');
      case 1:
        return const Text('Hotels Tab Content');
      case 2:
        return const Text('Transportation Tab Content');
      default:
        return Container();
    }
  }
}