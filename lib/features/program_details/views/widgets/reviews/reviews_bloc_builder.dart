import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_state.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_list.dart';

class ReviewsListBlocBuilder extends StatelessWidget {
  const ReviewsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      buildWhen: (previous, current) => previous.reviewStatus != current.reviewStatus,
      builder: (context, state) {
        switch (state.reviewStatus) {
          case ReviewStatus.loading:
            return SizedBox(
              height: 380.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              ),
            );

          case ReviewStatus.success:
            return ReviewsList(
              reviews: state.reviews ?? [],
            );

          case ReviewStatus.failure:
            return Center(
              child: FailureState(
                message: state.errorMessage,
                onRetry: () => context.read<ProgramDetailsCubit>().getReviews(),
              ),
            );

          default:
            return Center(
              child: FailureState(
                message: 'Something went wrong',
                onRetry: () => context.read<ProgramDetailsCubit>().getReviews(),
              ),
            );
        }
      },
    );
  }
}
