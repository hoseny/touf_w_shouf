import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class OutingsSectionHeader extends StatelessWidget {
  const OutingsSectionHeader({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            height: 28.h,
            width: 5.w,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          4.horizontalSpace,
          Text(
            title,
            style: TextStyles.font20BlackMedium,
          ),
          const Spacer(),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                'See All',
                style: TextStyles.font16BlackRegular,
              ),
            ),
        ],
      ),
    );
  }
}
