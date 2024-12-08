import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ProgramListHeader extends StatelessWidget {
  const ProgramListHeader({
    super.key,
  });

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
            'Best Selling',
            style: TextStyles.font20BlackMedium,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
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
