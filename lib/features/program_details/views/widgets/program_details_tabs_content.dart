import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/overview_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement.dart';

class ProgramDetailsTabsContent extends StatelessWidget {
  const ProgramDetailsTabsContent({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const OverviewTab();
      case 1:
        return const Supplement();
      case 2:
        return const Text("Photo Gallery content");
      case 3:
        return const Text("Reviews content");
      default:
        return const SizedBox.shrink();
    }
  }
}
