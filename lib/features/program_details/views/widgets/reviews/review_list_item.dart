import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';
import 'package:touf_w_shouf/features/program_details/data/models/review_model.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({
    super.key,
    required this.index,
    required this.review, required this.length,
  });

  final int index;
  final ReviewModel review;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              review.customer,
              style: TextStyles.font19BlackMedium,
            ),
            const Spacer(),
            AppStarRating(rating: review.rate.toString()),
          ],
        ),
        4.verticalSpace,
        Text(
          review.review,
          style: TextStyles.font16BlackRegular,
        ),
        if (index != length - 1)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: const Divider(
              color: Color(0xffC7C7C7),
            ),
          ),
      ],
    );
  }
}
