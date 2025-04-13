import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    required this.hintText,
    required this.items,
    this.onChanged,
  });

  final String title;
  final String hintText;
  final List<T> items;
  final dynamic Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font18BlackMedium,
        ),
        6.verticalSpace,
        CustomDropdown<T>(
          hintText: hintText,
          items: items,
          decoration: customDropdownDecoration(context),
          closedHeaderPadding: EdgeInsets.all(12.r),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return ' برجاء اختيار $title.';
            }
            return null;
          },
        ),
      ],
    );
  }

  CustomDropdownDecoration customDropdownDecoration(BuildContext context) {
    return CustomDropdownDecoration(
      hintStyle: TextStyles.font14Grey600Regular,
      headerStyle: TextStyles.font14Grey600Regular,
      listItemStyle: TextStyles.font14Grey600Regular,
      errorStyle: TextStyles.error,
      closedBorder: Border.all(
        color: const Color(0xFFE5E5E6),
      ),
      closedBorderRadius: BorderRadius.circular(4.r),
      closedErrorBorder: Border.all(
        color: AppColors.error,
      ),
      closedErrorBorderRadius: BorderRadius.circular(4.r),
      expandedBorder: Border.all(
        color: const Color(0xFFE5E5E6),
      ),
      closedFillColor: const Color(0xFFFDFDFD),
      expandedFillColor: const Color(0xFFFDFDFD),
      expandedBorderRadius: BorderRadius.circular(4.r),
    );
  }
}
