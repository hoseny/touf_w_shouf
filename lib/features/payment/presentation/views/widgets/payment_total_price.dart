import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class PaymentTotalPrice extends StatelessWidget {
  final String price;
  const PaymentTotalPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyles.font24BlackMedium,
              ),
              Text(
                price,
                style: TextStyles.font24BlackMedium,
              )
            ],
          ),
          10.verticalSpace,
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
