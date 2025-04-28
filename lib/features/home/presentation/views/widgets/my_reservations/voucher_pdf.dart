import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:touf_w_shouf/features/home/data/models/invoice_pdf_model.dart';

class InvoicePdf extends pw.StatelessWidget {
  final InvoicePdfModel data;

  InvoicePdf({required this.data});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Image(
              data.logo,
              width: 120.w,
              height: 120.h,
            ),
            pw.Spacer(),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'MISR TRAVEL',
                  style: pw.TextStyle(
                    fontSize: 24.sp,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue800,
                  ),
                ),
                pw.Text(
                  'Misr Travel Tower -- Abbassia Square / 1 Talaat Harb St., Cairo -- Egypt.',
                  style: pw.TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                pw.Text(
                  'Tel: +2 (02) 23930010 | www.misrtravel.net',
                  style: pw.TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 24.h),
        pw.Row(
          children: [
            pw.Text(
              'Invoice Status : ',
              style: pw.TextStyle(
                fontSize: 14.sp,
              ),
            ),
            pw.Text(
              data.invoiceStatus,
              style: pw.TextStyle(
                fontSize: 14.sp,
                fontWeight: pw.FontWeight.bold,
                color: data.statusColor,
              ),
            ),
          ],
        ),
        pw.SizedBox(
          height: 16,
        ),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: _detailsBox(
                'Trip Details',
                {
                  'Program Name': data.programName,
                  'Program Year': data.programYear,
                  'Date': data.date,
                },
              ),
            ),
            pw.SizedBox(width: 12.w),
            pw.Expanded(
              child: _detailsBox(
                'Trip Details',
                {
                  'Customer Name': data.customerName,
                  'Reservation No': data.reservationNo,
                  'Total Price': data.totalPrice,
                },
              ),
            ),
          ],
        ),
        pw.Spacer(),
        pw.Text(
          'Make all checks payable to MISR TRAVEL',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            fontSize: 12.sp,
          ),
        ),
        pw.SizedBox(height: 4.h),
        pw.Text(
          'If you have any questions concerning this invoice, use the following contact information:\n'
              'Contact Misr Travel, +2 (02) 23930010, info@misrtravel.net',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            fontSize: 12.sp,
          ),
        ),
        pw.SizedBox(height: 24.h),
        pw.Text(
          'THANK YOU FOR YOUR BUSINESS!',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            fontSize: 16.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
      ],
    );
  }

  pw.Widget _detailsBox(String title, Map<String, String> lines) {
    return pw.Container(
      padding: pw.EdgeInsets.all(12.r),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey200,
        borderRadius: pw.BorderRadius.circular(4.r),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 16.sp,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 16.h),
          ...lines.entries.map(
                (e) => pw.Padding(
              padding: pw.EdgeInsets.symmetric(
                vertical: 8.h,
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    e.key,
                    style: pw.TextStyle(
                      fontSize: 14.sp,
                      color: PdfColors.orange800,
                    ),
                  ),
                  pw.Text(
                    e.value,
                    style: pw.TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
