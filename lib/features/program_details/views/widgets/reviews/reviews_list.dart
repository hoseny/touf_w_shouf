import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        ? SizedBox(
            height: (96 * reviews.length).h,
            child: ListView.builder(
              itemCount: reviews.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ReviewListItem(
                  index: index,
                  review: reviews[index],
                  length: reviews.length,
                );
              },
            ),
          )
        : Center(
            child: Text(
              'No Reviews',
              style: TextStyles.font18OrangeMedium,
            ),
          );
  }
}
