import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geideapay/geideapay.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/payment/data/models/checkout/checkout_request.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/checkout/checkout_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/reservation/reservation_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';

class ConfirmPaymentButtons extends StatelessWidget {
  const ConfirmPaymentButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<CheckoutCubit, CheckoutState>(
          listener: (context, state) async {
            if (state is CheckoutSuccess) {
              final int totalPrice = context.read<ProgramGroupCubit>().calculateTotalPrice();
              final plugin = GeideapayPlugin();
              plugin.initialize(
                publicKey: state.checkoutResponse.checkout,
                apiPassword: state.checkoutResponse.checkout,
                serverEnvironment: ServerEnvironmentModel.EGY_PREPROD(),
              );
              CheckoutOptions checkoutOptions = CheckoutOptions(
                totalPrice.toDouble(),
                "EGP",
              );
              {
                try {
                  OrderApiResponse response = await plugin.checkout(
                    context: context,
                    checkoutOptions: checkoutOptions,
                  );
                  log('Response = $response');
                } catch (e) {
                  log("OrderApiResponse Error: $e");
                }
              }
            }
          },
          builder: (context, state) {
            final checkoutCubit = context.read<CheckoutCubit>();
            final ressp = context.read<ReservationCubit>().reservationResponse.resSp;
            final totalPrice = context.read<ProgramGroupCubit>().calculateTotalPrice();
            return AppButton(
              onPressed: () {
                checkoutCubit.checkout(
                  request: CheckoutRequest(
                    urlFalse: 'https://app.misrtravelco.net:4444/ords/invoice/r/onlinesystem/faild-page?',
                    urlTrue: 'https://app.misrtravelco.net:4444/ords/invoice/r/onlinesystem/sucess-page?',
                    accessType: 'Mobile',
                    custRef: SharedPref.getInt(key: SharedPrefKeys.custCode),
                    ressp: ressp,
                    totalPrice: totalPrice,
                    token: SharedPref.getString(key: SharedPrefKeys.token),
                  ),
                );
              },
              isLoading: state is CheckoutLoading,
              text: isEnglish(context) ? 'Confirm' : 'تأكيد',
              width: 358.w,
              height: 42.h,
              backgroundColor: AppColors.orange,
              borderRadius: 12.r,
            );
          },
        ),
        20.verticalSpace,
        AppButton(
          onPressed: () {
            final cubit = context.read<StepCubit>();
            cubit.previousStep();
          },
          text: isEnglish(context) ? 'Back' : 'إلغاء',
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
}
