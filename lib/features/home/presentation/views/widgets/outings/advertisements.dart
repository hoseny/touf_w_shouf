import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class Advertisements extends StatelessWidget {
  const Advertisements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          Image.asset(
            Assets.advertisement,
            height: 130.h,
            fit: BoxFit.cover,
          ),
          Container(
            height: 130.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  isEnglish(context) ? 'Planning a vacation?' : 'تخطط للعطلة؟',
                  style: TextStyles.font20WhiteMedium,
                ),
                Text(
                  isEnglish(context)
                      ? 'Choose your holiday packages.'
                      : 'اختر الحجوزات الخاصة بك',
                  style: TextStyles.font18WhiteRegular,
                ),
                AppButton(
                  onPressed: () {
                    context.pushNamed(
                      Routes.loginView,
                    );
                  },
                  text: isEnglish(context) ? 'Book' : 'احجز',
                  backgroundColor: AppColors.orange,
                  width: 100.w,
                  borderRadius: 6.r,
                  style: TextStyles.font18WhiteRegular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
