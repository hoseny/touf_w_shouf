import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';
import 'service_quantity_adjuster.dart';

class ServiceSelectionTile extends StatelessWidget {
  final String label;
  final String description;
  final int count;
  final Function() onIncrease;
  final Function() onDecrease;

  const ServiceSelectionTile({
    super.key,
    required this.label,
    required this.description,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 210.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(label, style: TextStyles.font16BlackMedium),
                8.verticalSpace,
                Text(
                  description,
                  style: TextStyles.font14deepTealRegular,
                ),
              ],
            ),
          ),
          const Spacer(),
          ServiceQuantityAdjuster(
            quantity: count,
            onIncrease: onIncrease,
            onDecrease: onDecrease,
          ),
        ],
      ),
    );
  }
}
