import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/review_cubit/review_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_tab.dart';

class ReviewsBlocBuilder extends StatelessWidget {
  const ReviewsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is ReviewLoading) {
          return  const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ReviewSuccess) {
          return const ReviewsTab();
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
