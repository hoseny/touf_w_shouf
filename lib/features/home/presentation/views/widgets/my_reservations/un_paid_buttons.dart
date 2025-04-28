import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geideapay/api/response/order_api_response.dart';
import 'package:geideapay/common/geidea.dart';
import 'package:geideapay/widgets/checkout/checkout_options.dart';
import 'package:pdf/pdf.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/pdf_service.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/args_model/pdf_args_model.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';

class UnPaidButtons extends StatelessWidget {
  const UnPaidButtons({
    super.key,
    required this.reservation,
  });

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      children: [
        AppButton(
          onPressed: () => _printPreInvoice(
            context,
            reservation,
          ),
          text: isEnglish(context)
              ? 'Print Pre Invoice'
              : 'طباعة الفاتورة المسبقة',
          height: 42.h,
          borderRadius: 12.r,
        ),
        AppButton(
          onPressed: () => _handlePayment(context),
          text: isEnglish(context) ? 'Pay Now' : 'دفع الان',
          height: 42.h,
          backgroundColor: AppColors.orange,
          borderRadius: 12.r,
        ),
      ],
    );
  }

  Future<void> _handlePayment(BuildContext context) async {
    _showLoadingDialog(context);

    final GeideapayPlugin plugin = getIt.get<GeideapayPlugin>();
    final CheckoutOptions options =
        _checkoutOptions(reservation.totalPayMent, context);

    try {
      OrderApiResponse response = await plugin.checkout(
        context: context,
        checkoutOptions: options,
      );

      log('Response = $response');

      if (!context.mounted) return;
      context.pop();

      if (response.responseMessage == "Success") {
        ToastHelper.showSuccessToast('Payment was completed.');
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

  Future<void> _printPreInvoice(BuildContext context, ReservationModel reservation) async {
    final pdfService = PdfService();

    await pdfService.createInvoicePdf(
      reservation: reservation,
      invoiceStatus: 'Unpaid',
      statusColor: PdfColors.green,
    );
    await pdfService.savePDF(reservation.programName); // etc.
    if (context.mounted) {
      context.pushNamed(
        Routes.pdfPreviewScreen,
        arguments: PdfArgsModel(
          pdf: pdfService.pdf,
          pdfName: reservation.programName,
        ),
      );
    }
  }
}
