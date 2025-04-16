import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_state.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/photo_gallery/photoe_gallery_tab.dart';

class PhotoGalleryBlocBuilder extends StatelessWidget {
  const PhotoGalleryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      buildWhen: (previous, current) => previous.photoGalleryStatus != current.photoGalleryStatus,
      builder: (context, state) {
        switch (state.photoGalleryStatus) {
          case PhotoGalleryStatus.loading:
            return SizedBox(
              height: 400.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryBlue,
                ),
              ),
            );

          case PhotoGalleryStatus.success:
            return PhotoGalleryTab(
              photos: state.photos!,
            );

          case PhotoGalleryStatus.failure:
            return FailureState(
              message: state.errorMessage,
              onRetry: () => context.read<ProgramDetailsCubit>().getPhotoGallery(),
            );

          default:
            return const Center(
              child: Text('Something went wrong'),
            );
        }
      },
    );
  }
}
