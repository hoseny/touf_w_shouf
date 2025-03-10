import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_cached_network_image.dart';
import 'package:touf_w_shouf/core/widgets/app_star_rating.dart';

class AppProgramHeader extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;

  const AppProgramHeader({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 294.86.h,
      toolbarHeight: 0,
      pinned: true,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            AppCachedNetworkImage(
              imgUrl: imageUrl,
              width: double.infinity,
              height: double.infinity,
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
                  // Program Title
                  Text(
                    title,
                    style: TextStyles.font18WhiteMedium,
                  ),
                  SizedBox(height: 10.h),
                  // Rating or "No Review" message
                  AppStarRating(
                    rating: rating,
                    itemSize: 20.0,
                    ignoreGestures: true, // Non-interactive rating
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
