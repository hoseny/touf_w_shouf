import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplementDivider extends StatelessWidget {
  const SupplementDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: const Divider(
        color: Color(0xffC7C7C7),
      ),
    );
  }
}
