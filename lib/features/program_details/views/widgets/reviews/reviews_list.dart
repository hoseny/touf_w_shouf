import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/review_cubit/review_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/review_list_item.dart';

import '../../../../../core/resources/styles.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<ReviewCubit>().state as ReviewSuccess;
    return state.reviews.isNotEmpty? SizedBox(
      height: (92 * state.reviews.length).h,
      child: ListView.builder(
        itemCount: state.reviews.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ReviewListItem(
            index: index,
            review: state.reviews[index],
          );
        },
      ),
    ):Center(
      child: Text(
        'No Reviews',
        style: TextStyles.font18OrangeMedium,
      ),
    );
  }
}
