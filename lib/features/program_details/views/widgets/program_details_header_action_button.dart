import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ProgramDetailsHeaderActionButton extends StatelessWidget {
  const ProgramDetailsHeaderActionButton({
    super.key,
    required this.svgPath,
    required this.text,
    this.lPadding, required this.onTap,
  });

  final String svgPath;
  final String text;
  final double? lPadding;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: lPadding ?? 0),
                  child: SvgPicture.asset(
                    svgPath,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ),
            ),
            6.horizontalSpace,
            Text(
              text,
              style: TextStyles.font16BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
