import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/review_form.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_bloc_builder.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgramDetailsCubit cubit = context.read<ProgramDetailsCubit>();
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
                ? 'Write your review for ${cubit.program.programName}'
                : 'اكتب تعليقك ${cubit.program.programName}',
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
                rating: cubit.userRating.toString(),
                ignoreGestures: false,
                itemSize: 26,
                onRatingUpdate: (double rating) {
                  cubit.userRating = rating;
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
