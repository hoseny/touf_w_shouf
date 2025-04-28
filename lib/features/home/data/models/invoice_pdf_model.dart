import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoicePdfModel {
  final pw.ImageProvider logo;
  final String invoiceStatus;
  final PdfColor statusColor;
  final String programName;
  final String programYear;
  final String date;
  final String customerName;
  final String reservationNo;
  final String totalPrice;

  InvoicePdfModel({
    required this.logo,
    required this.invoiceStatus,
    required this.statusColor,
    required this.programName,
    required this.programYear,
    required this.date,
    required this.customerName,
    required this.reservationNo,
    required this.totalPrice,
  });
}
