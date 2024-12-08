import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ActiveProgramLoading extends StatelessWidget {
  const ActiveProgramLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(
                right: index == 9 ? 0 : 16,
              ),
              child: Skeletonizer(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        Assets.listExample,
                        width: 265.w,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 265.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 4.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Start From',
                              style: TextStyles.font10mutedGreyRegular,
                            ),
                            Text(
                              '850 EGP',
                              style: TextStyles.font16OrangeSemiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 6.w,
                      right: 6.w,
                      bottom: 10.h,
                      child: SizedBox(
                        width: 265.w,
                        child: Text(
                          'The Egyptian Gulf (Hospice of the Sultan)',
                          style: TextStyles.font18WhiteMedium,
                        ),
                      ),
                    )
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}