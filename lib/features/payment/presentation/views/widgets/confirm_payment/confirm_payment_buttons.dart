import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geideapay/geideapay.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
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
              _showLoadingDialog(context);
              final int totalPrice = context.read<ProgramGroupCubit>().calculateTotalPrice();
              final GeideapayPlugin plugin = _initializeGeideaPlugin();
              CheckoutOptions checkoutOptions =
                  _checkoutOptions(totalPrice, context);
              {
                try {
                  OrderApiResponse response = await plugin.checkout(
                    context: context,
                    checkoutOptions: checkoutOptions,
                  );
                  log('Response = $response');
                  if (context.mounted) {
                    context.pop();
                    final step = context.read<StepCubit>();
                    step.nextStep();
                  }
                } catch (e) {
                  log("OrderApiResponse Error: $e");
                  ToastHelper.showErrorToast(e.toString());
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

  CheckoutOptions _checkoutOptions(int totalPrice, BuildContext context) {
    CheckoutOptions checkoutOptions = CheckoutOptions(
      totalPrice.toDouble(),
      isEnglish(context) ? "EGP" : '',
      lang: isEnglish(context) ? null : "AR",
      callbackUrl:
          "https://webhook.site/view/bc56cade-5f7c-4cd6-b652-0513e98f10c6",
      returnUrl: 'https://returnurl.com',
      paymentOperation: "Pay",
    );
    return checkoutOptions;
  }

  GeideapayPlugin _initializeGeideaPlugin() {
    final plugin = GeideapayPlugin();
    plugin.initialize(
      publicKey: '0c5da0b6-7be7-4f99-9d45-41cbb3a7d8a6',
      apiPassword: '84bd8f1b-caa6-458f-af6f-963fd9609668',
      serverEnvironment: ServerEnvironmentModel.EGY_PROD(),
    );
    return plugin;
  }

  Future<dynamic> _showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => Center(
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 8.h,
            children: [
              const CircularProgressIndicator(
                color: AppColors.orange,
              ),
              Text(
                '...برجاء الانتظار',
                style: TextStyles.font16WhiteBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
