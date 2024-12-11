import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/supplements_cubit/supplements_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_tab.dart';

class SupplementsBlocBuilder extends StatefulWidget {
  const SupplementsBlocBuilder({super.key});

  @override
  State<SupplementsBlocBuilder> createState() => _SupplementsBlocBuilderState();
}

class _SupplementsBlocBuilderState extends State<SupplementsBlocBuilder> {
  @override
  void initState() {
    context.read<SupplementsCubit>().getSupplements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplementsCubit, SupplementsState>(
      builder: (context, state) {
        if (state is SupplementsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SupplementsSuccess) {
          return SupplementTab();
        }

        if (state is SupplementsFailure) {
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
