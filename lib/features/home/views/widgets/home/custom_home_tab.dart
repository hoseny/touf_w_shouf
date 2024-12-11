import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class CustomHomeTab extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isActive;

  const CustomHomeTab({
    super.key,
    required this.iconPath,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: isActive
                  ? const ColorFilter.mode(AppColors.orange, BlendMode.srcIn)
                  : const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            6.horizontalSpace,
            Text(
              text,
              style: isActive ? TextStyles.font18OrangeMedium : TextStyles.font18WhiteMedium,
            ),
          ],
        ),
        const Divider(color: Colors.red,)
      ],
    );
  }
}
