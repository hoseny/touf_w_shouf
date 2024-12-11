import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/overview/overview_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/photo_gallery/photoe_gallery_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_tab.dart';

class ProgramDetailsTabsContent extends StatelessWidget {
  const ProgramDetailsTabsContent({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const OverviewTab();
      case 1:
        return const SupplementTab();
      case 2:
        return const PhotoGalleryTab();
      case 3:
        return const ReviewsTab();
      default:
        return const SizedBox.shrink();
    }
  }
}
