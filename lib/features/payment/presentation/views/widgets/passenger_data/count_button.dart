import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class CountButton extends StatelessWidget {
  const CountButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
