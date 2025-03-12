import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/data/models/display_payment.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data_row.dart';

class ConfirmPaymentData extends StatelessWidget {
  const ConfirmPaymentData({
    super.key,
    required this.payment,
  });

  final DisplayPaymentModel payment;

  @override
  Widget build(BuildContext context) {
    final bool english = isEnglish(context);
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          payment.programName,
          style: TextStyles.font20BlackMedium,
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Trip Date' : 'تاريخ الرحلة',
          value: payment.tripDate,
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Program Year' : 'سنة البرنامج',
          value: payment.programYear.toString(),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Customer Ref' : 'مرجع العميل',
          value: payment.customerRef.toString(),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Reservation Ref' : 'مرجع الحجز',
          value: payment.reservationRef.toString(),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Reservation SP' : 'حجز SP',
          value: payment.reservationSp.toString(),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Number of Adults' : 'عدد البالغين',
          value: payment.numberOfAdults.toString(),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Number of Children (1-6)' : 'عدد الأطفال (1-6)',
          value: '0',
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Number of Children (6-12)' : 'عدد الأطفال (6-12)',
          value: '0',
        ),
        ConfirmPaymentDataRow(
          title: english
              ? 'Total Without Additional Services'
              : 'الإجمالي بدون الخدمات الإضافية',
          value: payment.totalWithoutAdditionalService.toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: english
              ? 'Additional Service Total'
              : 'إجمالي الخدمات الإضافية',
          value: (payment.totalAdditionalService ?? 0).toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Total' : 'الإجمالي',
          value: payment.total.toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'VAT' : 'ضريبة القيمة المضافة',
          value: payment.vat.toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: english ? 'Total with VAT' : 'الإجمالي مع ضريبة القيمة المضافة',
          value: payment.totalIncludesVat.toStringAsFixed(0),
        ),
      ],
    );
  }
}
