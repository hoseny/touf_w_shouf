import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class ValidationRow extends StatelessWidget {
  final String text;
  final bool isValid;

  const ValidationRow({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check : Icons.circle_outlined,
            color: isValid ? Colors.green : AppColors.mediumGrey,
            size: 16,
          ),
          5.horizontalSpace,
          Text(
            text,
            style: isValid
                ? TextStyles.font14Green500Medium
                : TextStyles.font14Grey500Medium,
          ),
        ],
      ),
    );
  }
}
