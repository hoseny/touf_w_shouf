import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/advertisements.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/partners.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_list_view.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_section_header.dart';

class OutingsBody extends StatelessWidget {
  const OutingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutingsSectionHeader(
          title: 'Best Selling',
          onTap: () {},
        ),
        ProgramListView(),
        OutingsSectionHeader(title: 'Advertisements'),
        Advertisements(),
        OutingsSectionHeader(title: 'Partners'),
        Partners(),
        10.verticalSpace,
      ],
    );
  }
}

