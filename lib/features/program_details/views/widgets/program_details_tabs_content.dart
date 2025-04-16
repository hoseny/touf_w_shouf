import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/overview/overview_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/photo_gallery/photo_gallery_bloc_builder.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_tab.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_tab.dart';

class ProgramDetailsTabsContent extends StatelessWidget {
  const ProgramDetailsTabsContent({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final ProgramDetailsCubit cubit = context.read<ProgramDetailsCubit>();
    switch (index) {
      case 0:
        return const OverviewTab();
      case 1:
        cubit.getSupplements();
        return const SupplementTab();
      case 2:
        cubit.getPhotoGallery();
        return const PhotoGalleryBlocBuilder();
      case 3:
        cubit.getReviews();
        return const ReviewsTab();
      default:
        return const SizedBox.shrink();
    }
  }
}
