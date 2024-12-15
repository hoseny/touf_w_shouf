import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';

class ProgramHeader extends StatelessWidget {
  const ProgramHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgramGroupCubit>();
    return AppProgramHeader(
      imageUrl: cubit.program.imgPath,
      title: cubit.program.programName,
      rating: cubit.program.rateReview,
    );
  }
}
