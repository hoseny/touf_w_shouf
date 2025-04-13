import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/display_payment/display_payment_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/reservation/reservation_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';

class PassengerDataButtons extends StatelessWidget {
  const PassengerDataButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<ReservationCubit, ReservationState>(
          listener: (context, state) {
            if (state is ReservationSuccess) {
              final displayPayment = context.read<DisplayPaymentCubit>();
              final String refNo = state.reservationResponse.refNo.toString();
              final String ressp = state.reservationResponse.resSp.toString();
              displayPayment.getPayment(
                refNo: refNo,
                ressp: ressp,
              );
              final step = context.read<StepCubit>();
              step.nextStep();
            } else if (state is ReservationFailure) {
              ToastHelper.showErrorToast(state.errorMessage);
            }
          },
          builder: (context, state) {
            return AppButton(
              onPressed: () => onPayPressed(context),
              isLoading: state is ReservationLoading,
              text: isEnglish(context) ? 'Pay' : 'ادفع',
              width: 358.w,
              height: 42.h,
              backgroundColor: AppColors.orange,
              borderRadius: 12.r,
            );
          },
        ),
        20.verticalSpace,
        AppButton(
          onPressed: () {},
          text: isEnglish(context)
              ? 'Add to my shopping cart'
              : 'اضافة لسلة التسوق',
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
    final ProgramGroupCubit groupCubit = context.read<ProgramGroupCubit>();
    final ReservationCubit reservationCubit = context.read<ReservationCubit>();
    if (groupCubit.calculateTotalCount() == 0) {
      ToastHelper.showErrorToast(
        isEnglish(context)
            ? 'Please add at least one passenger'
            : 'يرجى اضافة على الاقل مسافر',
      );
    } else if (groupCubit.state.isTermsAccepted == false) {
      ToastHelper.showErrorToast(
        isEnglish(context)
            ? 'Please accept terms and conditions'
            : 'يرجى قبول الشروط والاحكام',
      );
    } else {
      reservationCubit.postReservation(
        request: ReservationRequest(
          custRef: SharedPref.getInt(key: SharedPrefKeys.custCode).toString(),
          telephone: SharedPref.getString(key: SharedPrefKeys.telephone),
          progGrpNo: groupCubit.programGroup.progGrpNo.toString(),
          progCode: groupCubit.program.code.toString(),
          progYear: groupCubit.program.programYear.toString(),
          lang: '1',
        ),
        groupPrices: groupCubit.state.groupPrice!,
        programGroup: groupCubit.programGroup,
        program: groupCubit.program,
      );
    }
  }
}
