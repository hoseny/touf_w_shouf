import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({
    super.key, required this.index,
  });
  final int index;
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
              'Ahmed kamel',
              style: TextStyles.font19BlackMedium,
            ),
            const Spacer(),
            const AppStarRating(rating: '3.5'),
          ],
        ),
        4.verticalSpace,
        Text(
          'Lorem ipsum dolor sit amet, cum ',
          style: TextStyles.font16BlackRegular,
        ),
        if (index != 4)
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
