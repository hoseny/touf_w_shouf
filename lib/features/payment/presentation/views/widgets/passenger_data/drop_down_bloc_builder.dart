import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/custom_drop_down.dart';

class DropDownBlocBuilder extends StatelessWidget {
  const DropDownBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgramGroupCubit cubit = context.read<ProgramGroupCubit>();
    return BlocBuilder<ProgramGroupCubit, ProgramGroupState>(
      builder: (context, state) {
        switch (state.programGroupStatus) {
          case ProgramGroupStatus.loading:
            return SizedBox(
              height: 120.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              ),
            );
          case ProgramGroupStatus.success:
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomDropDown<ProgramGroup>(
                title: 'Pick Date',
                hintText: 'Please Pick a Date',
                items: state.programGroups!,
                onChanged: (programGroup) {
                  cubit.programGroup = programGroup!;
                  cubit.getGroupPrice(
                    programCode: cubit.program.code.toString(),
                    programYear: cubit.program.programYear.toString(),
                    groupNumber: programGroup.progGrpNo.toString(),
                  );
                },
              ),
            );

          case ProgramGroupStatus.failure:
            return SizedBox(
              height: 200.h,
              child: Center(
                child: FailureState(
                  message: state.errorMessage,
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
