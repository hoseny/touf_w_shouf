import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/supplements_cubit/supplements_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_list.dart';

class SupplementsListBlocBuilder extends StatelessWidget {
  const SupplementsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplementsCubit, SupplementsState>(
      builder: (context, state) {
        if (state is SupplementsLoading) {
          return SizedBox(
            height: 160.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            ),
          );
        } else if (state is SupplementsSuccess) {
          return const SupplementList();
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
