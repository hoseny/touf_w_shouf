import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_state.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgramDetailsState state = context.read<ProgramDetailsCubit>().state;
    final ProgramDetailsModel programDetails = state.programDetails!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        programDetails.overview,
        style: TextStyles.font16BlackRegular,
      ),
    );
  }
}
