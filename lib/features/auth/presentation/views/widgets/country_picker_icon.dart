import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class CountryPickerIcon extends StatelessWidget {
  final String countryFlag;
  final VoidCallback showCountryPicker;

  const CountryPickerIcon({
    required this.countryFlag,
    required this.showCountryPicker,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showCountryPicker,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              countryFlag,
              style: TextStyle(fontSize: 20.sp),
            ),
             SizedBox(width: 2.w),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xffB3BECD),
              size: 16.sp,
            ),
            SizedBox(width: 10.w),
            Container(
              width: 1,
              height: 30,
              color: AppColors.mediumGrey,
            ),
          ],
        ),
      ),
    );
  }
}
