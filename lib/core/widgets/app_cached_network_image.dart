import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imgUrl,
    this.height,
    this.width,
    this.borderRadius,
  });

  final String imgUrl;
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        maxHeightDiskCache: 1200,
        maxWidthDiskCache: 800,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.orange,
          ),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: AppColors.error,
          size: 45.w,
        ),
      ),
    );
  }
}
