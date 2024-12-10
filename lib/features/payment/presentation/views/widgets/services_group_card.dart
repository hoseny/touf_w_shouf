import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'service_selection_tile.dart';

class ServicesGroupCard extends StatelessWidget {
  final String title;
  final List<ServiceSelectionTile> services;

  const ServicesGroupCard({
    super.key,
    required this.title,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Container(
        width: 358.w,
        decoration: BoxDecoration(
          color: AppColors.softWhite,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                Text(
                  title,
                  style: TextStyles.font18CharcoalGreyMedium,
                ),
              ],
            ),
            ...services
          ],
        ),
      ),
    );
  }
}
