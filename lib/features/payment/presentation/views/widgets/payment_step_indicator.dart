import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_stepper/smart_stepper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class PaymentStepIndicator extends StatelessWidget {
  const PaymentStepIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildStepper(),
          Positioned(
            bottom: -30.h,
            left: 0,
            right: 0,
            child: _buildStepLabels(),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return SmartStepper(
      currentStep: 1,
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
      onStepperTap: (step) {},
    );
  }

  Widget _buildStepLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepLabel("Passenger data"),
        _buildStepLabel("Payment and Confirm"),
        _buildStepLabel("Success"),
      ],
    );
  }

  Widget _buildStepLabel(String label) {
    return SizedBox(
      width: 98.w,
      child: Text(
        label,
        style: TextStyles.font16CharcoalGreyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
