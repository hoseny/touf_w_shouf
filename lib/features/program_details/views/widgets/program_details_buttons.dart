import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          left: 10.w,
          right: 64.w,
          top: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconTextButton(
                  svgPath: Assets.heart,
                  text: 'Add To Wishlist',
                  onTap: () {},
                ),
                Spacer(),
                IconTextButton(
                  svgPath: Assets.map,
                  text: 'Map',
                  onTap: () {},
                ),
              ],
            ),
            10.verticalSpace,
            IconTextButton(
              svgPath: Assets.play,
              text: 'Watch Video',
              lPadding: 4,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
