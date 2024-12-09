import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_divider.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_list.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_vat.dart';

class Supplement extends StatelessWidget {
  const Supplement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The price includes supplement:',
            style: TextStyles.font18BlackMedium,
          ),
          4.verticalSpace,
          SupplementList(),
          SupplementDivider(),
          SupplementVAT(),
        ],
      ),
    );
  }
}


