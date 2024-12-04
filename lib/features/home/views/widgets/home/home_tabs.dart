import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_tab/home_tab_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/custom_home_tab.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final tabNames = [
            'Outings',
            'Hotels',
            'Transportation',
          ];
          final tabIcons = [
            Assets.outings,
            Assets.hotel,
            Assets.transportation,
          ];
          return BlocBuilder<HomeTabCubit, HomeTabState>(
            builder: (context, state) {
              final cubit = context.read<HomeTabCubit>();
              if (state is HomeTabIndexUpdated) {
                return GestureDetector(
                  onTap: () => cubit.updateIndex(index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomHomeTab(
                      iconPath: tabIcons[index],
                      text: tabNames[index],
                      isActive: state.index == index,
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
