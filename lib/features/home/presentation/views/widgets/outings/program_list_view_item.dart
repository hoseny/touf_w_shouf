import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_cached_network_image.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/home/price_tag.dart';

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
          child: AppCachedNetworkImage(
            imgUrl: program.imgPath,
            width: 265.w,
            height: double.infinity,
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
        PriceTag(price: program.startPrice,),
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
              AppStarRating(
                rating: program.rateReview,
              ),
            ],
          ),
        )
      ],
    );
  }
}


