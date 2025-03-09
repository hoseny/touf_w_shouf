import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key, required this.price,
  });

  final num price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 6.h,
          vertical: 4.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Start From',
              style: TextStyles.font10mutedGreyRegular,
            ),
            Text(
              '$price EGP',
              style: TextStyles.font16OrangeSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
