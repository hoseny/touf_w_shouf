import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_stepper/smart_stepper.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';

class PaymentStepIndicator extends StatelessWidget {
  const PaymentStepIndicator({
    super.key,
  });

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
    return BlocBuilder<StepCubit, int>(
      builder: (context, currentStep) {
        return SmartStepper(
          currentStep: currentStep + 1,
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
      },
    );
  }

  Widget _buildStepLabels() {
    return BlocBuilder<StepCubit, int>(
      builder: (context, currentStep) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepLabel(label: isEnglish(context)? "Passenger Data" : "بيانات المسافر", isActive: currentStep >= 0),
            _buildStepLabel(label: isEnglish(context)? "Payment and Confirm" : "الدفع و التأكيد", isActive: currentStep >= 1),
            _buildStepLabel(label: isEnglish(context)? "Success" : "نجاح", isActive: currentStep >= 2),
          ],
        );
      },
    );
  }

  Widget _buildStepLabel({required String label, required bool isActive}) {
    return SizedBox(
      width: 98.w,
      child: Text(
        label,
        style: isActive
            ? TextStyles.font16CharcoalGreyMedium
            : TextStyles.font16fadedGreyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
