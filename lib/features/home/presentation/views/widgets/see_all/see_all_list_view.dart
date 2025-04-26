import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_cached_network_image.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/home/price_tag.dart';


class SeeAllListViewItem extends StatelessWidget {
  const SeeAllListViewItem({super.key, required this.programModel});

  final ProgramModel programModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      child: SizedBox(
        height: 109.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Stack(
                children: [
                  AppCachedNetworkImage(
                    width: 180,
                    height: 110,
                    imgUrl: programModel.imgPath ,
                  ),
                  PriceTag(
                    price: programModel.startPrice,
                  ),
                ],
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: ItemDetails(
                title: programModel.programName,
                rating: double.tryParse(programModel.rateReview) ?? 0.0,
                textStyle: TextStyles.font16BlackMedium,
                isSpacer: true,
                verticalSpace: 0,
                horizontalSpace: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ItemDetails extends StatelessWidget {
  const ItemDetails(
      {super.key,
        required this.title,
        required this.rating,
        this.textStyle,
        this.isSpacer = false,
        this.verticalSpace,
        this.horizontalSpace});

  final String title;
  final double rating;
  final TextStyle? textStyle;
  final bool? isSpacer;
  final double? verticalSpace;
  final double? horizontalSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSpace ?? 16.w, vertical: verticalSpace ?? 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle ?? TextStyles.font18WhiteMedium,
          ),
          (isSpacer == true) ? const Spacer() : 6.verticalSpace,
          AppStarRating(
            rating: rating.toString(),
          ),
        ],
      ),
    );
  }
}