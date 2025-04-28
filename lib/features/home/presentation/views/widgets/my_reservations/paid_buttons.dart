import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/pdf_service.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/args_model/pdf_args_model.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/voucher_cubit/voucher_cubit.dart';

class PaidButtons extends StatelessWidget {
  const PaidButtons({
    super.key,
    required this.reservation,
  });

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    bool isVoucherPrinted = false;
    return Column(
      spacing: 6.h,
      children: [
        AppButton(
          onPressed: () => _printInvoice(context, reservation),
          text: 'Print invoice',
        ),
        BlocListener<VoucherCubit, VoucherState>(
          listener: (context, state) {
            if (state is VoucherSuccess && !isVoucherPrinted) {
              _printVoucher(
                context,
                state.voucher,
              );
              isVoucherPrinted = true;
            }
            if (state is VoucherFailure) {
              ToastHelper.showErrorToast(state.message);
            }
          },
          child: AppButton(
            onPressed: () {
              context
                  .read<VoucherCubit>()
                  .getVoucher(resNo: reservation.reservationNo.toString());
            },
            text: 'Print Voucher',
            backgroundColor: AppColors.orange,
            isLoading: context.watch<VoucherCubit>().state is VoucherLoading,
          ),
        ),
      ],
    );
  }

  Future<void> _printInvoice(
      BuildContext context, ReservationModel reservation) async {
    final pdfService = PdfService();

    await pdfService.createInvoicePdf(
      reservation: reservation,
      invoiceStatus: 'Paid',
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

  Future<void> _printVoucher(BuildContext context, Voucher voucher) async {
    final pdfService = PdfService();

    await pdfService.createVoucherPdf(
      voucher: voucher,
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
