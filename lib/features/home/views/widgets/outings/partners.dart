import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';

class Partners extends StatelessWidget {
  const Partners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.partner1),
        2.horizontalSpace,
        Image.asset(Assets.partner2),
        2.horizontalSpace,
        Image.asset(Assets.partner3),
      ],
    );
  }
}
