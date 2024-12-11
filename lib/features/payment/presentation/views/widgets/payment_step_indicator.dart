import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_stepper/smart_stepper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class PaymentStepIndicator extends StatelessWidget {
  final int currentStep;

  const PaymentStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _buildStepper(),
          _buildStepLabels(),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return SmartStepper(
      currentStep: currentStep,
      totalSteps: 3,
      completeStepColor: AppColors.orange,
      currentStepColor: AppColors.orange,
      inactiveStepColor: AppColors.fadedGrey,
      completeTextColor: AppColors.white,
      currentTextColor: AppColors.white,
      inactiveTextColor: AppColors.white,
      completeLineColor: AppColors.orange,
      currentLineColor: AppColors.fadedGrey,
      inactiveLineColor: AppColors.fadedGrey,
      stepWidth: 24.w,
      stepHeight: 24.h,
      lineWidth: 125.w,
      lineHeight: 2.h,
      borderWidth: 2.w,
      lineBorderRadius: 10.r,
      isTextShowing: true,
      onStepperTap: (step) {},
    );
  }

  Widget _buildStepLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStepLabel("Passenger data"),
        _buildStepLabel("Payment and Confirm"),
        _buildStepLabel("Success"),
      ],
    );
  }

  Widget _buildStepLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(left: 5.h),
      child: SizedBox(
        width: 120.w,
        height: 50.h,
        child: Text(
          label,
          style: TextStyles.font16CharcoalGreyMedium,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
