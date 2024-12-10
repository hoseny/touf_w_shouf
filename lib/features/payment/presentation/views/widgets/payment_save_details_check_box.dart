import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class PaymentSaveDetailsCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const PaymentSaveDetailsCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!isChecked),
          child: Column(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.fadedGrey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: isChecked
                    ? Icon(
                  Icons.check,
                  size: 15.w,
                  color: AppColors.orange,
                )
                    : null,
              ),
              15.verticalSpace
            ],
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(
            'Save my payment details for future booking',
            style: TextStyles.font14Grey700Medium,
          ),
        ),
      ],
    );
  }
}
