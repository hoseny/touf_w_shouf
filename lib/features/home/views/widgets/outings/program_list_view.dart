import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_list_view_item.dart';

class ProgramListView extends StatelessWidget {
  const ProgramListView({
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
            child: ProgramListViewItem(),
          );
        },
      ),
    );
  }
}
