import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/review_cubit/review_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/review_form.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_bloc_builder.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReviewsListBlocBuilder(),
          10.verticalSpace,
          Text(
            isEnglish(context)
                ? 'Write your review for ${context.read<ReviewCubit>().program.programName}'
                : 'اكتب تعليقك ${context.read<ReviewCubit>().program.programName}',
            style: TextStyles.font18CharcoalGreyRegular,
          ),
          12.verticalSpace,
          Row(
            children: [
              Text(
                isEnglish(context) ? 'Your review' : 'تعليقك',
                style: TextStyles.font18BlackMedium,
              ),
              const Spacer(),
              AppStarRating(
                rating: context.read<ReviewCubit>().userRating.toString(),
                ignoreGestures: false,
                itemSize: 26,
                onRatingUpdate: (double rating) {
                  context.read<ReviewCubit>().userRating = rating;
                },
              )
            ],
          ),
          const ReviewForm(),
        ],
      ),
    );
  }
}
