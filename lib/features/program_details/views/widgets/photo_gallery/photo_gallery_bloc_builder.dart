import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/photo_gallery_cubit/photo_gallery_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/photo_gallery/photoe_gallery_tab.dart';

class PhotoGalleryBlocBuilder extends StatelessWidget {
  const PhotoGalleryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoGalleryCubit, PhotoGalleryState>(
      builder: (context, state) {
        if (state is PhotoGalleryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PhotoGallerySuccess) {
          return PhotoGalleryTab(
            photos: state.photos,
          );
        } else if (state is PhotoGalleryFailure) {
          return FailureState(
            message: state.errorMessage,
            onRetry: () => context.read<PhotoGalleryCubit>().getPhotoGallery(),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
