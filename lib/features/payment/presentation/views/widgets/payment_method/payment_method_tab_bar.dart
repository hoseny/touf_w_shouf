import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

import 'payment_visa_method_form.dart';

class PaymentMethodTabBar extends StatefulWidget {
  const PaymentMethodTabBar({super.key});

  @override
  PaymentMethodTabBarState createState() => PaymentMethodTabBarState();
}

class PaymentMethodTabBarState extends State<PaymentMethodTabBar> {
  int selectedIndex = 0;

  final List<Map<String, String>> paymentMethods = [
    {'label': 'VISA', 'image': Assets.visa},
    {'label': 'MasterCard', 'image': Assets.masterCard},
    {'label': 'PayPal', 'image': Assets.payPal},
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Choose payment method',
                style: TextStyles.font18CharcoalGreyMedium,
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(paymentMethods.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 107.w,
                    height: 53.h,
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: selectedIndex == index ? AppColors.orange : AppColors.white,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      paymentMethods[index]['image']!,
        
                    ),
                  ),
                );
              }),
            ),
            20.verticalSpace,
            if (paymentMethods[selectedIndex]['label'] == 'VISA')
              const PaymentVisaMethodForm(),
          ],
        ),
      ),
    );
  }
}
