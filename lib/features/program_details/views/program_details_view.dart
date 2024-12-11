import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/photo_gallery_cubit/photo_gallery_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/review_cubit/review_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/supplements_cubit/supplements_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_bloc_builder.dart';

class ProgramDetailsView extends StatelessWidget {
  const ProgramDetailsView({super.key, required this.program});

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProgramDetailsCubit(
            getIt.get<ProgramDetailsRepoImpl>(),
            program,
          )..getProgramDetails(),
        ),
        BlocProvider(
          create: (context) => SupplementsCubit(
            getIt.get<ProgramDetailsRepoImpl>(),
            program,
          )..getSupplements(),
        ),
        BlocProvider(
          create: (context) => PhotoGalleryCubit(
            getIt.get<ProgramDetailsRepoImpl>(),
            program,
          )..getPhotoGallery(),
        ),
        BlocProvider(
          create: (context) => ReviewCubit(
            getIt.get<ProgramDetailsRepoImpl>(),
            program,
          )..getReviews(),
        ),
      ],
      child: const Scaffold(
        body: ProgramDetailsBodyBlocBuilder(),
      ),
    );
  }
}
