import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ProgramDetailsHeaderLoading extends StatelessWidget {
  const ProgramDetailsHeaderLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverAppBar(
        expandedHeight: 260.h,
        toolbarHeight: 0,
        pinned: false,
        backgroundColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 20.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Egyptian Gulf (Hospice of The SultanHospice of The Sultan)',
                      style: TextStyles.font18WhiteMedium,
                    ),
                    10.verticalSpace,
                    Text(
                      'No Review',
                      style: TextStyles.font18WhiteMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
