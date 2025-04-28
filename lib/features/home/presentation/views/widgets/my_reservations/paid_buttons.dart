import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/pdf_service.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/args_model/pdf_args_model.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';

class PaidButtons extends StatelessWidget {
  const PaidButtons({
    super.key, required this.reservation,
  });
  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      children: [
        AppButton(
          onPressed: () => _printInvoice(context, reservation),
          text: 'Print Invoice',
        ),
        AppButton(
          onPressed: () {},
          text: 'Print Voucher',
          backgroundColor: AppColors.orange,
        ),
      ],
    );
  }

  Future<void> _printInvoice(BuildContext context, ReservationModel reservation) async {
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
}
