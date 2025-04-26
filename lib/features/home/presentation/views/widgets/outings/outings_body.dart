import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/routing/args_model/sell_all_model.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/outings/active_program_bloc_builder.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/outings/advertisements.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/outings/day_use_programs_bloc_builder.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/outings/partners.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/outings/program_section_header.dart';

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
              arguments: SeeAllModel(
                title: context.tr(LocaleKeys.activePrograms),
                isDayUsePrograms: false,
              ),
            );
          },
        ),
        const ActiveProgramBlocBuilder(),
        OutingsSectionHeader(title: context.tr(LocaleKeys.advertisements)),
        const Advertisements(),
        OutingsSectionHeader(
          title: 'Day Use',
          onTap: () {
            context.pushNamed(
              Routes.seeAllView,
              arguments: SeeAllModel(
                title: isEnglish(context) ? 'Day Use' : 'الرحلات',
                isDayUsePrograms: true,
              ),
            );
          },
        ),
        const DayUseProgramsBlocBuilder(),
        OutingsSectionHeader(title: context.tr(LocaleKeys.partners)),
        const Partners(),
        10.verticalSpace,
      ],
    );
  }
}
