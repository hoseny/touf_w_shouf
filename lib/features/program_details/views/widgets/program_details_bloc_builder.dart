import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_body.dart';

class ProgramDetailsBodyBlocBuilder extends StatelessWidget {
  const ProgramDetailsBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      builder: (context, state) {
        if (state is ProgramDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBlue,
            ),
          );
        } else if (state is ProgramDetailsSuccess) {
          return const ProgramDetailsBody();
        } else if (state is ProgramDetailsFailure) {
          return FailureState(
            message: state.errorMessage,
            onRetry: () =>
                context.read<ProgramDetailsCubit>().getProgramDetails(),
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
