import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/outings_body.dart';

class HomeTabContent extends StatelessWidget {
  final int index;

  const HomeTabContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return OutingsBody();
      case 1:
        return const Text('Hotels Tab Content');
      case 2:
        return const Text('Transportation Tab Content');
      default:
        return Container();
    }
  }
}