import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('A journey through history starting from the gates of Fatimid Cairo at Bab al-Futuh, passing through our monuments and stories of  Egyptian history and heritage From Bab Al-Futuh, through the story of Sidi El-Zouk, passing by Al-Hakim Mosque, Bamir Allah',style: TextStyles.font16BlackRegular,),
          10.verticalSpace,
          Text('Additional Info',style: TextStyles.font18BlackMedium,),
          2.verticalSpace,
          Text('Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate',style: TextStyles.font16BlackRegular,),
        ],
      ),
    );
  }
}
