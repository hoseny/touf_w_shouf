import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_tile.dart';

class PassengerDataList extends StatelessWidget {
  const PassengerDataList({super.key, required this.groupPrice});

  final List<GroupPrice> groupPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.ultraLightWhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          const BoxShadow(
            color: AppColors.ultraLightGrey,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: groupPrice.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return PassengerDataTile(
            groupPrice: groupPrice[index],
            index: index,
          );
        },
      ),
    );
  }
}
