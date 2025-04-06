import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';

class AppStarRating extends StatelessWidget {
  final String rating;
  final double itemSize;
  final bool ignoreGestures;
  final ValueChanged<double>? onRatingUpdate;
  const AppStarRating({
    super.key,
    required this.rating,
    this.itemSize = 20.0,
    this.ignoreGestures = true, this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return rating != 'No Review'
        ? RatingBar(
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
      initialRating: double.parse(rating),
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize.w,
      updateOnDrag: false,
      tapOnlyMode: false,
      ignoreGestures: ignoreGestures,
      onRatingUpdate: onRatingUpdate ?? (double value) {},
    )
        : Text(
      isEnglish(context) ? 'No Review' : 'لا يوجد تقييم',
      style: TextStyle(
        fontSize: 18.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
