import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/icon_text_button.dart';

class ProgramDetailsButtons extends StatelessWidget {
  const ProgramDetailsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: isEnglish(context)? 10.w : 64.w,
          right: isEnglish(context)? 64.w : 10.w,
          top: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconTextButton(
                  svgPath: Assets.heart,
                  text: isEnglish(context)
                      ? 'Add To Wishlist'
                      : 'اضافة للمفضلة',
                  onTap: () {},
                ),
                const Spacer(),
                IconTextButton(
                  svgPath: Assets.map,
                  text: isEnglish(context) ? 'Map' : 'خريطة',
                  onTap: () {},
                ),
              ],
            ),
            10.verticalSpace,
            IconTextButton(
              svgPath: Assets.play,
              text: isEnglish(context) ? 'Watch Video' : 'مشاهدة الفيديو',
              lPadding: 4,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
