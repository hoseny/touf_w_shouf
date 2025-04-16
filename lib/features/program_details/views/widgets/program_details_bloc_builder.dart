import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_state.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_body.dart';

class ProgramDetailsBodyBlocBuilder extends StatelessWidget {
  const ProgramDetailsBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      buildWhen: (previous, current) => previous.programDetailsStatus != current.programDetailsStatus,
      builder: (context, state) {
        switch (state.programDetailsStatus) {
          case ProgramDetailsStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            );
          case ProgramDetailsStatus.success:
            return const ProgramDetailsBody();
          case ProgramDetailsStatus.failure:
            return Center(
              child: FailureState(
                message: state.errorMessage,
                onRetry: () =>
                    context.read<ProgramDetailsCubit>().getProgramDetails(),
              ),
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
