import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/features/program_details/data/models/review_model.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/review_list_item.dart';

import '../../../../../core/resources/styles.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
    required this.reviews,
  });

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return reviews.isNotEmpty
        ? ListView.builder(
            itemCount: reviews.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return ReviewListItem(
                index: index,
                review: reviews[index],
                length: reviews.length,
              );
            },
          )
        : SizedBox(
            height: 100.h,
            child: Center(
              child: Text(
                isEnglish(context) ? 'No Reviews' : 'لا يوجد تقييمات',
                style: TextStyles.font18OrangeMedium,
              ),
            ),
          );
  }
}
