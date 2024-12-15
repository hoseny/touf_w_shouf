import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/increment_decrement_buttons.dart';

class PassengerDataTile extends StatelessWidget {
  const PassengerDataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.softWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        title: Text(
          'Adult',
          style: TextStyles.font16BlackMedium,
        ),
        subtitle: Text(
          '50 EGP From 20 to 50 (year)',
          style: TextStyles.font14deepTealRegular,
        ),
        trailing: const IncrementDecrementButtons(),
      ),
    );
  }
}
