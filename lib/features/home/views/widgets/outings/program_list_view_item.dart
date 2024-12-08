import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

class ProgramListViewItem extends StatelessWidget {
  const ProgramListViewItem({
    super.key,
    required this.program,
  });

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CachedNetworkImage(
            imageUrl: program.imgPath,
            width: 265.w,
            height: double.infinity,
            fit: BoxFit.cover,
            maxHeightDiskCache: 1200,
            maxWidthDiskCache: 800,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: AppColors.error,
              size: 45.w,
            ),
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
                  '${program.startPrice.toString()} EGP',
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
                  program.programName,
                  style: TextStyles.font18WhiteMedium,
                ),
              ),
              program.rateReview != 'No Review'
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
                      initialRating: double.parse(program.rateReview),
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
                      program.rateReview,
                      style: TextStyles.font18WhiteMedium,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
