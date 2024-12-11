import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/active_program_bloc_builder.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/advertisements.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/partners.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_section_header.dart';

class OutingsBody extends StatelessWidget {
  const OutingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutingsSectionHeader(
          title: 'Active Programs',
          onTap: () {},
        ),
        const ActiveProgramBlocBuilder(),
        const OutingsSectionHeader(title: 'Advertisements'),
        const Advertisements(),
        const OutingsSectionHeader(title: 'Partners'),
        const Partners(),
        10.verticalSpace,
      ],
    );
  }
}

