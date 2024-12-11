import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit/program_details_cubit.dart';

class ProgramDetailsHeader extends StatelessWidget {
  const ProgramDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgramDetailsCubit>();
    return AppProgramHeader(
      imageUrl: cubit.program.imgPath,
      title: cubit.program.programName,
      rating: cubit.program.rateReview,
    );
  }
}
