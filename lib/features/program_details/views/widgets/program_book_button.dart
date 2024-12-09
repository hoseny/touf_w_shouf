import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';

class ProgramBookButton extends StatelessWidget {
  const ProgramBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: AppButton(
          onPressed: () {},
          text: 'Book Now',
          style: TextStyles.font18WhiteMedium,
          backgroundColor: AppColors.orange,
        ),
      ),
    );
  }
}
