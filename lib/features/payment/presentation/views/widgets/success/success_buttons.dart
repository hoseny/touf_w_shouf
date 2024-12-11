import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class SuccessButtons extends StatelessWidget {
  const SuccessButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          AppButton(
            onPressed: () {
              context.pushNamed(Routes.paymentView);
            },
            text: 'Make another booking',
            width: 358.w,
            backgroundColor: AppColors.orange,
            borderRadius: 5.r,
          ),
          20.verticalSpace,
          AppButton(
            onPressed: () {
              context.pushNamed(Routes.homeView);
            },
            text: 'Return home',
            width: 358.w,
            borderRadius: 5.r,
            backgroundColor: AppColors.orange,
            variant: ButtonVariant.outlined,
            textColor: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
