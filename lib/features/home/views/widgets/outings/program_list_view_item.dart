import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ProgramListViewItem extends StatelessWidget {
  const ProgramListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            Assets.listExample,
            width: 265.w,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 265.w,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 4.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Start From',
                  style: TextStyles.font10mutedGreyRegular,
                ),
                Text(
                  '850 EGP',
                  style: TextStyles.font16OrangeSemiBold,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 6.w,
          right: 6.w,
          bottom: 10.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 265.w,
                child: Text(
                  'The Egyptian Gulf (Hospice of the Sultan)',
                  style: TextStyles.font18WhiteMedium,
                ),
              ),
              RatingBar(
                ratingWidget: RatingWidget(
                  full: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: SvgPicture.asset(Assets.starFull),
                  ),
                  half: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: SvgPicture.asset(Assets.starHalf),
                  ),
                  empty: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: SvgPicture.asset(Assets.starEmpty),
                  ),
                ),
                initialRating: 3.6,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.w,
                updateOnDrag: false,
                tapOnlyMode: false,
                ignoreGestures: true,
                onRatingUpdate: (double rating) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
