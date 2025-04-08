import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';

class Partners extends StatelessWidget {
  const Partners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4.w,
        children: [
          Expanded(child: Image.asset(Assets.partner1)),
          Expanded(child: Image.asset(Assets.partner2)),
          Expanded(child: Image.asset(Assets.partner3)),
        ],
      ),
    );
  }
}
