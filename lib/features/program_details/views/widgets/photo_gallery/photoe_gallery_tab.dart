import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_cached_network_image.dart';
import 'package:touf_w_shouf/features/program_details/data/models/photo_gallery_model.dart';

class PhotoGalleryTab extends StatelessWidget {
  const PhotoGalleryTab({
    super.key,
    required this.photos,
  });

  final List<PhotoGalleryModel> photos;

  @override
  Widget build(BuildContext context) {
    return photos.isNotEmpty
        ? SizedBox(
            height: 400.w,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return AppCachedNetworkImage(
                  imgUrl: photos[index].image,
                  borderRadius: 12.r,
                );
              },
            ),
          )
        : SizedBox(
            height: 100.w,
            child: Center(
              child: Text(
                'No Images',
                style: TextStyles.font18OrangeMedium,
              ),
            ),
          );
  }
}
