import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_state.dart';

class MyReservationsTabBar extends StatelessWidget {
  const MyReservationsTabBar({super.key});

  static final List<String> tabTitles = [
    'Paid Reservations',
    'Unpaid Reservations',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomTabBar(
          tabTitles: tabTitles,
          selectedIndex: state.reservationTabIndex,
          onTabChanged: (index) {
            context.read<HomeCubit>().updateReservationTab(index);
            switch(index) {
              case 0:
                context.read<HomeCubit>().getPaidReservations();
                break;
              case 1:
                context.read<HomeCubit>().getUnpaidReservations();
                break;
            }
          },
        );
      },
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabTitles,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<String> tabTitles;
  final int selectedIndex;
  final Function(int) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: List.generate(
          tabTitles.length,
          (index) => Expanded(
            child: InkWell(
              onTap: () => onTabChanged(index),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: selectedIndex == index
                        ? Text(
                            tabTitles[index],
                            style: TextStyles.font18OrangeMedium,
                          )
                        : Text(
                            tabTitles[index],
                            style: TextStyles.font18BlackMedium,
                          ),
                  ),
                  if (selectedIndex == index)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2.h,
                        decoration: const BoxDecoration(
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
