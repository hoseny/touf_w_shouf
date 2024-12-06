import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'validation_progress_indicator.dart';
import 'validation_row.dart';

class ResetPasswordValidations extends StatelessWidget {
  final bool minLength;
  final bool hasNumber;
  final bool hasSymbol;
  final bool hasUppercase;
  final bool hasLowercase;

  const ResetPasswordValidations({
    super.key,
    required this.minLength,
    required this.hasNumber,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasSymbol,
  });

  @override
  Widget build(BuildContext context) {
    double percent = _calculateValidationProgress();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          ValidationProgressIndicator(percent: percent),
          20.verticalSpace,
          ValidationRow(
            text: "At least 8 characters",
            isValid: minLength,
          ),
          10.verticalSpace,
          ValidationRow(
            text: "Least one number (0-9) or symbol",
            isValid: hasNumber || hasSymbol,
          ),
          10.verticalSpace,
          ValidationRow(
            text: "Lowercase (a-z) and uppercase (A-Z)",
            isValid: hasUppercase && hasLowercase,
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  double _calculateValidationProgress() {
    int criteriaMet = (minLength ? 1 : 0) +
        (hasNumber || hasSymbol ? 1 : 0) +
        (hasUppercase && hasLowercase ? 1 : 0);
    const int totalCriteria = 3;
    return criteriaMet / totalCriteria;
  }
}
