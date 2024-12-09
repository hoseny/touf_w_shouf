import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import '../../../../../core/resources/colors.dart';

class TripDateTimeWidget extends StatelessWidget {
  final String tripDate;
  final String tripTime;

  const TripDateTimeWidget({
    super.key,
    required this.tripDate,
    required this.tripTime,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          20.verticalSpace,
          _buildDateInfoContainer(
            iconPath: Assets.date,
            label: "Trip Date:",
            value: tripDate,
          ),
          20.verticalSpace,
          _buildDateInfoContainer(
            iconPath: Assets.clock,
            label: "Trip Time:",
            value: tripTime,
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildDateInfoContainer({
    required String iconPath,
    required String label,
    required String value,
  }) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
          SizedBox(width: 16.w),
          Text(
            label,
            style: TextStyles.font16FadedGreyMedium,
          ),
          SizedBox(width: 4.w),
          Text(
            value,
            style: TextStyles.font16CharcoalGreyMedium,
          ),
        ],
      ),
    );
  }
}
