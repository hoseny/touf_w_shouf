import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          payment.programName,
          style: TextStyles.font20BlackMedium,
        ),
        ConfirmPaymentDataRow(
          title: 'Trip Date',
          value: payment.tripDate,
        ),
        ConfirmPaymentDataRow(
          title: 'Program Year',
          value: payment.programYear.toString(),
        ),
        ConfirmPaymentDataRow(
          title: 'Customer Ref',
          value: payment.customerRef.toString(),
        ),
        ConfirmPaymentDataRow(
          title: 'Reservation Ref',
          value: payment.reservationRef.toString(),
        ),
        ConfirmPaymentDataRow(
          title: 'Reservation SP',
          value: payment.reservationSp.toString(),
        ),
        ConfirmPaymentDataRow(
          title: 'Number of Adults',
          value: payment.numberOfAdults.toString(),
        ),
        const ConfirmPaymentDataRow(
          title: 'Number of Children (1-6)',
          value: '0',
        ),
        const ConfirmPaymentDataRow(
          title: 'Number of Children (6-12)',
          value: '0',
        ),
        ConfirmPaymentDataRow(
          title: 'Total Without Additional Services',
          value: payment.totalWithoutAdditionalService.toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: 'Additional Service Total',
          value: (payment.totalAdditionalService ?? 0).toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: 'Total',
          value: payment.total.toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: 'VAT',
          value: payment.vat.toStringAsFixed(0),
        ),
        ConfirmPaymentDataRow(
          title: 'Total with VAT',
          value: payment.totalIncludesVat.toStringAsFixed(0),
        ),
      ],
    );
  }
}
