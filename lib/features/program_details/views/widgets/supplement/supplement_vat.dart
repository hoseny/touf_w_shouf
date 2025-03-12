import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class SupplementVAT extends StatelessWidget {
  const SupplementVAT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.informationCircle),
        16.horizontalSpace,
        Text(
          isEnglish(context)
              ? 'All prices don\'t include VAT'
              : 'جميع الأسعار لا تشمل الضريبة',
          style: TextStyles.font18OrangeMedium,
        ),
      ],
    );
  }
}
