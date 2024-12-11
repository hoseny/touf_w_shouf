import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/active_program_loading.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_list_view.dart';

class ActiveProgramBlocBuilder extends StatelessWidget {
  const ActiveProgramBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ActiveProgramsLoading) {
          return const ActiveProgramLoading();
        } else if (state is ActiveProgramsSuccess) {
          return ProgramListView(
            programs: state.programs,
          );
        } else if (state is ActiveProgramsFailure) {
          return FailureState(
            message: state.errorMessage,
            onRetry: () => context.read<HomeCubit>().getActivePrograms(),
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
