import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/supplements_cubit/supplements_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_tab.dart';

class SupplementsBlocBuilder extends StatelessWidget {
  const SupplementsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplementsCubit, SupplementsState>(
      builder: (context, state) {
        if (state is SupplementsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SupplementsSuccess) {
          return const SupplementTab();
        } else if (state is SupplementsFailure) {
          return FailureState(
            message: state.errorMessage,
            onRetry: () => context.read<SupplementsCubit>().getSupplements(),
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
