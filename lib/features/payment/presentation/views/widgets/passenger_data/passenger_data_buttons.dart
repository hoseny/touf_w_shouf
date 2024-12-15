import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';

class PassengerDataButtons extends StatelessWidget {
  const PassengerDataButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          onPressed: () => onPayPressed(context),
          text: 'Pay',
          width: 358.w,
          height: 42.h,
          backgroundColor: AppColors.orange,
          borderRadius: 12.r,
        ),
        20.verticalSpace,
        AppButton(
          onPressed: () {},
          text: 'Add to my shopping cart',
          width: 358.w,
          height: 42.h,
          borderRadius: 12.r,
          backgroundColor: AppColors.orange,
          variant: ButtonVariant.outlined,
          textColor: AppColors.orange,
        ),
      ],
    );
  }

  void onPayPressed(BuildContext context) {
    final cubit = context.read<ProgramGroupCubit>();
    if (cubit.calculateTotalCount() == 0) {
      ToastHelper.showErrorToast(
        'Please add at least one passenger',
      );
    } else if (cubit.isTermsAccepted == false) {
      ToastHelper.showErrorToast(
        'Please accept terms and conditions',
      );
    } else {
      final step = context.read<StepCubit>();
      step.nextStep();
    }
  }
}
