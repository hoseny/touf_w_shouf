import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class IncrementDecrementButtons extends StatelessWidget {
  const IncrementDecrementButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ultraLightGrey,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        spacing: 12.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(Icons.remove),
          Text(
            '0',
            style: TextStyles.font14FadedGreyMedium,
          ),
          _buildButton(Icons.add),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 30.r,
        height: 30.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.deepTeal,
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 18.sp,
        ),
      ),
    );
  }
}
