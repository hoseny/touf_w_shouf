import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:printing/printing.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/home/data/models/invoice_pdf_model.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/invoice_pdf.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/voucher_pdf.dart';

class PdfService {
  final pdf = pw.Document();

  Future<void> createPDF() async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) =>
            pw.Center(
              child: pw.Text('Hello World!'),
            ),
      ),
    );
  }

  Future<String> savePDF(String pdfName) async {
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/$pdfName.pdf");
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }

  Future<void> openPDF(String path) async {
    await OpenFile.open(path);
  }

  Future<void> printPDF() async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  Future<void> createInvoicePdf({
    required ReservationModel reservation,
    required String invoiceStatus,
    required PdfColor statusColor,
  }) async {
    final ByteData bd = await rootBundle.load('assets/images/partner2.png');
    final Uint8List bytes = bd.buffer.asUint8List();
    final pw.MemoryImage logoImage = pw.MemoryImage(bytes);
    final invoicePdfData = InvoicePdfModel(
      logo: logoImage,
      invoiceStatus: invoiceStatus,
      statusColor: statusColor,
      programName: reservation.programName,
      programYear: reservation.progYear.toString(),
      date: DateFormat('dd/MM/yyyy').format(reservation.dateTrip),
      customerName: SharedPref.getString(key: SharedPrefKeys.customerName),
      reservationNo: reservation.reservationNo.toString(),
      totalPrice: '${reservation.totalPayMent} EGP',
    );
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        build: (_) =>
            InvoicePdf(
              data: invoicePdfData,
            ),
      ),
    );
  }

  Future<void> createVoucherPdf({ required Voucher voucher }) async {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        footer: (context) => pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text('Page ${context.pageNumber} of ${context.pagesCount}'),
        ),
        build: (context) => [
          VoucherPdf(voucher: voucher),
        ],
      ),
    );
  }

}
