import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_state.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_list.dart';

class SupplementsListBlocBuilder extends StatelessWidget {
  const SupplementsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      buildWhen: (previous, current) => previous.supplementsStatus != current.supplementsStatus,
      builder: (context, state) {
        switch (state.supplementsStatus) {
          case SupplementsStatus.loading:
            return SizedBox(
              height: 160.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              ),
            );
          case SupplementsStatus.success:
            return const SupplementList();
          case SupplementsStatus.failure:
            return FailureState(
              message: state.errorMessage,
              onRetry: () => context.read<ProgramDetailsCubit>().getSupplements(),
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
