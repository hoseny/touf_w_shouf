import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_success/customer_details.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_success/payment_success_buttons.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_success/trip_details.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.ultraLightWhite,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              const BoxShadow(
                color: AppColors.ultraLightGrey,
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.h,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff007489),
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.white,
                  size: 80.r,
                ),
              ),
              Text(
                isEnglish(context) ? 'Booking Successful' : 'تم الحجز بنجاح',
                style: TextStyles.font18BlackMedium,
              ),
              Text(
                isEnglish(context) ? 'Thank you for Choosing Touf w shof' : 'شكرا لاختياركم طوف و شوف',
                style: TextStyles.font14Grey600Regular,
              ),
              4.verticalSpace,
              const CustomerDetails(),
              4.verticalSpace,
              const TripDetails(),
            ],
          ),
        ),
        const PaymentSuccessButtons(),
        16.verticalSpace,
      ],
    );
  }
}



