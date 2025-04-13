import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/custom_home_tab.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key});

  static const List<String> _tabIcons = [
    Assets.outings,
    Assets.hotel,
    Assets.transportation,
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> tabNames = [
      context.tr(LocaleKeys.outings),
      context.tr(LocaleKeys.hotels),
      context.tr(LocaleKeys.transportation),
    ];
    final cubit = context.watch<HomeCubit>();
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabNames.length,
        separatorBuilder: (_, __) => 16.horizontalSpace,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => cubit.updateTab(index),
            child: CustomHomeTab(
              iconPath: _tabIcons[index],
              text: tabNames[index],
              isActive: cubit.state.tabIndex == index,
            ),
          );
        },
      ),
    );
  }
}
