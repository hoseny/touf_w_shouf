import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_list.dart';

class PassengerDataListBlocBuilder extends StatelessWidget {
  const PassengerDataListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramGroupCubit, ProgramGroupState>(
      builder: (context, state) {
        if (state is ProgramGroupSuccess) {
          return PassengerDataList(
            groupPrice: state.groupPrice,
          );
        } else if (state is ProgramGroupLoading) {
          return SizedBox(
            height: 120.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            ),
          );
        } else if (state is ProgramGroupFailure) {
          return Center(
            child: FailureState(
              message: state.errorMessage,
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
