import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/review_form.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/reviews_list.dart';

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
          ReviewsList(),
          Text(
            'Write your review “The Egyptian Gulf”',
            style: TextStyles.font18CharcoalGreyRegular,
          ),
          12.verticalSpace,
          Row(
            children: [
              Text(
                'Your review',
                style: TextStyles.font18BlackMedium,
              ),
              Spacer(),
              AppStarRating(
                rating: '4',
                ignoreGestures: false,
                itemSize: 26,
                onRatingUpdate: (double rating) {},
              )
            ],
          ),
          ReviewForm(),
        ],
      ),
    );
  }
}
