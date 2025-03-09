import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
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
          title: context.tr(LocaleKeys.activePrograms),
          onTap: () {
            context.pushNamed(
              Routes.seeAllView,
              arguments: context.tr(
                LocaleKeys.activePrograms,
              ),
            );
          },
        ),
        const ActiveProgramBlocBuilder(),
        OutingsSectionHeader(title: context.tr(LocaleKeys.advertisements)),
        const Advertisements(),
        OutingsSectionHeader(title: context.tr(LocaleKeys.partners)),
        const Partners(),
        10.verticalSpace,
      ],
    );
  }
}
