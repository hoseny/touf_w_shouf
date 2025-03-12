import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_divider.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_vat.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplements_bloc_builder.dart';

class SupplementTab extends StatelessWidget {
  const SupplementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isEnglish(context)
                ? 'The price includes supplement:'
                : 'السعر يشمل الاضافات:',
            style: TextStyles.font18BlackMedium,
          ),
          4.verticalSpace,
          const SupplementsListBlocBuilder(),
          const SupplementDivider(),
          const SupplementVAT(),
        ],
      ),
    );
  }
}
