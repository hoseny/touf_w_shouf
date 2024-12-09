import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ProgramDetailsHeader extends StatelessWidget {
  const ProgramDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260.h,
      toolbarHeight: 0,
      pinned: false,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.asset(
              Assets.listExample,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 20.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Egyptian Gulf (Hospice of The Sultan)',
                    style: TextStyles.font18WhiteMedium,
                  ),
                  10.verticalSpace,
                  '3.4' != 'No Review'
                      ? RatingBar(
                    ratingWidget: RatingWidget(
                      full: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 1.5.w),
                        child: SvgPicture.asset(Assets.starFull),
                      ),
                      half: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 1.5.w),
                        child: SvgPicture.asset(Assets.starHalf),
                      ),
                      empty: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 1.5.w),
                        child: SvgPicture.asset(Assets.starEmpty),
                      ),
                    ),
                    initialRating: double.parse('3.7'),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.w,
                    updateOnDrag: false,
                    tapOnlyMode: false,
                    ignoreGestures: true,
                    onRatingUpdate: (double rating) {},
                  )
                      : Text(
                    'No Review',
                    style: TextStyles.font18WhiteMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
