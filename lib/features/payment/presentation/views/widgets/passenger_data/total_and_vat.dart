import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class TotalAndVat extends StatelessWidget {
  const TotalAndVat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyles.font24BlackMedium,
              ),
              Text(
                '0',
                style: TextStyles.font24BlackMedium,
              )
            ],
          ),
          Row(
            children: [
              Text(
                "The total includes VAT",
                style: TextStyles.font20OrangeMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
