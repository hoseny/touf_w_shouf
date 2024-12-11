import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/data/models/supplements_model.dart';

class SupplementListItem extends StatelessWidget {
  const SupplementListItem({
    super.key,
    required this.supplement,
  });

  final SupplementsModel supplement;

  @override
  Widget build(BuildContext context) {

    RegExp regExp = RegExp(r'(.+?)(\d+)\s*EGP');
    Match? match = regExp.firstMatch(supplement.thePriceIncludesSupplement);

    String description = match != null ? match.group(1)!.trim() : 'No description';
    String price = match != null ? match.group(2)! : '0';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.checkMark,
                width: 24.w,
                height: 24.h,
              ),
              8.horizontalSpace,
              Expanded(
                child: Text(
                  description,
                  style: TextStyles.font16BlackRegular,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            '$price EGP',
            style: TextStyles.font18deepBlueSemiBold,
          ),
        ],
      ),
    );
  }
}
