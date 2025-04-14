import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geideapay/geideapay.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';

class ConfirmPaymentButtons extends StatelessWidget {
  const ConfirmPaymentButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          onPressed: () => _handlePayment(context),
          text: isEnglish(context) ? 'Confirm' : 'تأكيد',
          width: 358.w,
          height: 42.h,
          backgroundColor: AppColors.orange,
          borderRadius: 12.r,
        ),
        20.verticalSpace,
        AppButton(
          onPressed: () => context.pop(),
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

  Future<void> _handlePayment(BuildContext context) async {
    _showLoadingDialog(context);

    final num totalPrice = context.read<ProgramGroupCubit>().calculateTotalPrice();
    final GeideapayPlugin plugin = getIt.get<GeideapayPlugin>();
    final CheckoutOptions options = _checkoutOptions(totalPrice, context);

    try {
      OrderApiResponse response = await plugin.checkout(
        context: context,
        checkoutOptions: options,
      );

      log('Response = $response');

      if (!context.mounted) return;
      context.pop();

      if (response.responseMessage == "Success") {
        context.read<StepCubit>().nextStep();
      } else {
        ToastHelper.showErrorToast(
          response.responseMessage != null
              ? response.responseMessage!
              : "Payment was not completed.",
        );
      }
    } catch (e) {
      log("OrderApiResponse Error: $e");
      if (context.mounted) context.pop();
      ToastHelper.showErrorToast(e.toString());
    }
  }

  CheckoutOptions _checkoutOptions(num totalPrice, BuildContext context) {
    double formattedPrice = double.parse(totalPrice.toDouble().toStringAsFixed(2));
    return CheckoutOptions(
      formattedPrice,
      isEnglish(context) ? "EGP" : '',
      lang: isEnglish(context) ? null : "AR",
      callbackUrl: 'https://app.misrtravelco.net:4444/ords/invoice/r/onlinesystem/faild-page?',
      returnUrl: 'https://app.misrtravelco.net:4444/ords/invoice/r/onlinesystem/sucess-page?',
      paymentOperation: "Pay",
    );
  }

  Future<void> _showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColors.orange),
              10.verticalSpace,
              Text('...برجاء الانتظار', style: TextStyles.font16WhiteBold),
            ],
          ),
        ),
      ),
    );
  }
}
