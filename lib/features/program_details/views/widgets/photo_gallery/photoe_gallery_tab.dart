import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/widgets/app_cached_network_image.dart';

class PhotoGalleryTab extends StatelessWidget {
  const PhotoGalleryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.w,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return AppCachedNetworkImage(
            imgUrl: 'https://app.misrtravelco.net:4444/i/images/OnlineSystem/Program/Basic_2024_8_1.jpg',
            borderRadius: 12.r,
          );
        },
      ),
    );
  }
}
