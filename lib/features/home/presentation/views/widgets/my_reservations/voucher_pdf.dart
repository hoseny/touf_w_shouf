import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';

class VoucherPdf extends pw.StatelessWidget {
  final Voucher voucher;

  VoucherPdf({
    required this.voucher,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Tour Service Voucher',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 12.h),
        pw.Row(
          children: [
            textRow(
              title: 'Voucher No: ',
              value: voucher.voucherNo.toString(),
            ),
            pw.Spacer(),
            textRow(
              title: 'Issue Date: ',
              value: voucher.issueDate,
            ),
          ],
        ),
        pw.SizedBox(height: 8.h),
        pw.Divider(
          color: PdfColors.blue800,
          thickness: 2.h,
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'PASSENGER DETAILS',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Name: ',
          value: voucher.customerName,
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Phone: ',
          value: voucher.phone,
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Email: ',
          value: voucher.email,
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'No. of Travelers: ',
          value: '${voucher.adultNo.toString()} Adults',
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'TRAVEL SERVICE DETAILS',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Service Type: ',
          value: voucher.serviceType,
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Destination: ',
          value: '[ ${voucher.city} / ${voucher.country} ]',
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Service Dates: ',
          value: 'From ${voucher.dateStart} to ${voucher.dateEnd}',
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Number of Nights: ',
          value: '${voucher.nightCount} Nights',
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'INCLUDED SERVICES',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.only(left: 16.w),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  if (voucher.includedService[0].hotel != null)
                    _bulletPointText(voucher.includedService[0].hotel!),
                  pw.SizedBox(height: 8.h),
                  if (voucher.includedService[1].sightseeing != null)
                    _bulletPointText(voucher.includedService[1].sightseeing!),
                  pw.SizedBox(height: 8.h),
                  if (voucher.includedService[2].transport != null)
                    _bulletPointText(voucher.includedService[2].transport!),
                ],
              ),
            ),
            pw.SizedBox(height: 10.h),
          ],
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'SUPPLIER / SERVICE PROVIDER DETAILS',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            for (var provider in voucher.providers) ...[
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 16.w),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    textRow(
                      title: 'Provider Name: ',
                      value: provider.providerName,
                    ),
                    pw.SizedBox(height: 8.h),
                    textRow(
                      title: 'Provider Email: ',
                      value: provider.providerEmail,
                    ),
                    pw.SizedBox(height: 8.h),
                    textRow(
                      title: 'Provider Phone: ',
                      value: provider.providerPhone,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 10.h),
            ],
          ],
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'BOOKING & PAYMENT STATUS',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Booking Reference:: ',
          value: voucher.bookingReference.toString(),
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Payment Status:: ',
          value: 'Paid',
        ),
        pw.SizedBox(height: 8.h),
        textRow(
          title: 'Issued By: ',
          value: 'Online Reservation',
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'IMPORTANT NOTES',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Padding(
          padding: pw.EdgeInsets.only(left: 16.w),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _bulletPointText(
                'Please present this voucher upon arrival or at the beginning of service.',
              ),
              pw.SizedBox(height: 8.h),
              _bulletPointText(
                'This voucher is non-transferable and valid only for the services mentioned.',
              ),
              pw.SizedBox(height: 8.h),
              _bulletPointText(
                'For any issues during travel, please contact our 24/7 support 19341.',
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          'BON VOYAGE! HAVE A GREAT TRIP!',
          style: pw.TextStyle(
            fontSize: 18.sp,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue800,
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Text(
          '(This voucher is issued by Misr Travel as proof of booking and confirmation.)',
          style: pw.TextStyle(
            fontSize: 12.sp,
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Divider(
          color: PdfColors.grey400,
        ),
        pw.SizedBox(height: 8.h),
        pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Misr Travel Tower - Abbassia Square / 1 Talaat Harb St., Cairo - Egypt.',
            style: pw.TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
        pw.SizedBox(height: 8.h),
        pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Tel: +2 (02) 23930010 | www.misrtravel.net',
            style: pw.TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
        pw.SizedBox(height: 8.h),
      ],
    );
  }

  pw.Widget textRow({
    required String title,
    required String value,
  }) {
    return pw.RichText(
      textAlign: pw.TextAlign.start,
      text: pw.TextSpan(
        children: [
          pw.TextSpan(
            text: title,
            style: pw.TextStyle(
              fontSize: 14.sp,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.TextSpan(
            text: value,
            style: pw.TextStyle(
              fontSize: 14.sp,
              color: PdfColors.red800,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _bulletPointText(String text) {
    return pw.Row(
      children: [
        pw.Container(
          width: 4.w,
          height: 4.w,
          decoration: const pw.BoxDecoration(
            color: PdfColors.black,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.SizedBox(width: 8.w),
        pw.Text(
          text,
          style: pw.TextStyle(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
