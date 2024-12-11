import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/expandable_container.dart';

class TourTermsAndPolicies extends StatelessWidget {
  const TourTermsAndPolicies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state =
        context.read<ProgramDetailsCubit>().state as ProgramDetailsSuccess;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ExpandableContainer(
            title: 'Tour Including',
            description: state.programDetails.tourIncluding,
          ),
          16.verticalSpace,
          ExpandableContainer(
            title: 'Tour Excluding',
            description: state.programDetails.tourExcluding,
          ),
          16.verticalSpace,
          ExpandableContainer(
            title: 'Cancellation policy',
            description: '',
          ),
        ],
      ),
    );
  }
}
