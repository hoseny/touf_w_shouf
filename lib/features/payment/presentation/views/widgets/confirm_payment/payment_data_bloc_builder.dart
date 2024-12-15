import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/display_payment/display_payment_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data_box.dart';

class PaymentDataBlocBuilder extends StatelessWidget {
  const PaymentDataBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayPaymentCubit, DisplayPaymentState>(
      builder: (context, state) {
        if (state is DisplayPaymentSuccess) {
          return ConfirmPaymentDataBox(
            payment: state.paymentModel,
          );
        } else if (state is DisplayPaymentLoading) {
          return SizedBox(
            height: 250.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            ),
          );
        } else if (state is DisplayPaymentFailure) {
          return SizedBox(
            height: 250.h,
            child: Center(
              child: FailureState(
                message: state.errorMessage,
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 250.h,
            child: const Center(
              child: FailureState(
                message: 'Something went wrong',
              ),
            ),
          );
        }
      },
    );
  }
}
