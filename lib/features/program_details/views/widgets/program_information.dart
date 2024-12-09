import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_information_tile.dart';

class ProgramInformation extends StatelessWidget {
  const ProgramInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
              const BoxShadow(
                color: Colors.transparent,
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(-2, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgramInformationTile(
                svg: Assets.location,
                title: 'Location: ',
                value: 'Egypt, Cairo',
              ),
              ProgramInformationTile(
                svg: Assets.price,
                title: 'Price: ',
                value: '850 EGP',
              ),
              ProgramInformationTile(
                svg: Assets.clock,
                title: 'Duration time: ',
                value: '3 Hour/s',
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: ProgramInformationTile(
                  svg: Assets.walking,
                  title: '',
                  value: 'Walking Tour',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
