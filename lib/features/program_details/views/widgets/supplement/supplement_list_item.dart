import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class SupplementListItem extends StatelessWidget {
  const SupplementListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.checkMark,
                width: 24.w,
                height: 24.h,
              ),
              8.horizontalSpace,
              Text(
                '12 working hours Hyundai H1 car',
                style: TextStyles.font16BlackRegular,
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            '1290 EGP',
            style: TextStyles.font18deepBlueSemiBold,
          ),
        ],
      ),
    );
  }
}
