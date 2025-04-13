import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_state.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_list_view.dart';

class DayUseProgramsBlocBuilder extends StatelessWidget {
  const DayUseProgramsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.dayUseProgramStatus) {
          case DayUseProgramStatus.loading:
            return SizedBox(
              height: 214.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryBlue,
                ),
              ),
            );
          case DayUseProgramStatus.success:
            return ProgramListView(
              programs: state.dayUsePrograms!,
            );
          case DayUseProgramStatus.failure:
            return FailureState(
              message: state.errorMessage,
              onRetry: () => context.read<HomeCubit>().getActivePrograms(),
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
