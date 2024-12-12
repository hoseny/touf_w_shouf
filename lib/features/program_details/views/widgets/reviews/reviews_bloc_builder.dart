import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/review_cubit/review_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_list.dart';

class ReviewsListBlocBuilder extends StatelessWidget {
  const ReviewsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      buildWhen: (previous, current) =>
          current is ReviewLoading ||
          current is ReviewSuccess ||
          current is ReviewFailure,
      builder: (context, state) {
        if (state is ReviewLoading) {
          return SizedBox(
            height: 380.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            ),
          );
        } else if (state is ReviewSuccess) {
          return ReviewsList(
            reviews: state.reviews,
          );
        } else if (state is ReviewFailure) {
          return FailureState(
            message: state.errorMessage,
            onRetry: () => context.read<ReviewCubit>().getReviews(),
          );
        } else {
          return FailureState(
            message: 'Something went wrong',
            onRetry: () => context.read<ReviewCubit>().getReviews(),
          );
        }
      },
    );
  }
}
