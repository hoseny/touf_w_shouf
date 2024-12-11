import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class ServiceQuantityAdjuster extends StatelessWidget {
  const ServiceQuantityAdjuster({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });
  final int quantity;
  final Function() onIncrease;
  final Function() onDecrease;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.ultraLightGrey,
          borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrease,
            child: Container(
              width: 30.r,
              height: 30.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.deepTeal,
              ),
              child: Center(
                child: Icon(Icons.remove, color: AppColors.white, size: 18.sp),
              ),
            ),
          ),
          12.horizontalSpace,
          Text(
            '$quantity',
            style: TextStyles.font14FadedGreyMedium,
          ),
          12.horizontalSpace,
          GestureDetector(
            onTap: onIncrease,
            child: Container(
              width: 30.r,
              height: 30.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.deepTeal,
              ),
              child: Icon(Icons.add, color: AppColors.white, size: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
