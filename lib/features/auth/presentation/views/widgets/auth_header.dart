import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class AuthHeader extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double? imageHeight;
  final double? titleSpacing;
  final double? subtitleSpacing;

  const AuthHeader({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.imageHeight = 255.56,
    this.titleSpacing = 10,
    this.subtitleSpacing = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: imageHeight!.h,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.5.r)),
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.error, size: 30.sp));
              },
            ),
          ),
        ),
        titleSpacing!.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            title,
            style: titleStyle ?? TextStyles.font26GreyExtraBold,
            textAlign: TextAlign.center,
          ),
        ),
        subtitleSpacing!.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            subtitle,
            style: subtitleStyle ?? TextStyles.font14GreyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        20.verticalSpace,
      ],
    );
  }
}
