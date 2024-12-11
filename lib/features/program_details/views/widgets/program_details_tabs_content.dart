import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/overview/overview_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/photo_gallery/photo_gallery_bloc_builder.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplements_bloc_builder.dart';

class ProgramDetailsTabsContent extends StatelessWidget {
  const ProgramDetailsTabsContent({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const OverviewTab();
      case 1:
        return const SupplementsBlocBuilder();
      case 2:
        return const PhotoGalleryBlocBuilder();
      case 3:
        return const ReviewsTab();
      default:
        return const SizedBox.shrink();
    }
  }
}
