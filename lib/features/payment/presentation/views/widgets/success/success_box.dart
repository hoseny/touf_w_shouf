import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

import 'trip_details.dart';

class SuccessBox extends StatelessWidget {
  final String tripName;
  final String bookingDate;
  final String tripDate;
  final String egyptiansNumber;
  final String childrenNumber;
  final String totalWithoutServices;
  final String total;
  final String vat;
  final String totalWithVat;
  final String cancellationDeadline;

  const SuccessBox({
    super.key,
    required this.tripName,
    required this.bookingDate,
    required this.tripDate,
    required this.egyptiansNumber,
    required this.childrenNumber,
    required this.totalWithoutServices,
    required this.total,
    required this.vat,
    required this.totalWithVat,
    required this.cancellationDeadline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
      child: Container(
        width: 358.w,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: AppColors.ultraLightWhite,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.102),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.success,
              width: 80.w,
              height: 80.h,
            ),
            SizedBox(height: 10.h),
            Text(
              'Booking Successful',
              style: TextStyles.font18CharcoalGreyMedium,
            ),
            SizedBox(height: 5.h),
            Text(
              'Thank you for Choosing Touf w shof',
              style: TextStyles.font16FadedGreyRegular,
            ),
            SizedBox(height: 16.h),
            TripDetails(
              tripName: tripName,
              bookingDate: bookingDate,
              tripDate: tripDate,
              egyptiansNumber: egyptiansNumber,
              childrenNumber: childrenNumber,
              totalWithoutServices: totalWithoutServices,
              total: total,
              vat: vat,
              totalWithVat: totalWithVat,
              cancellationDeadline: cancellationDeadline,
            ),
          ],
        ),
      ),
    );
  }
}
