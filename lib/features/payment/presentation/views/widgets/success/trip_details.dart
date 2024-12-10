import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

import 'trip_details_row.dart';

class TripDetails extends StatelessWidget {
  final String tripName;
  final String bookingDate;
  final String tripDate;
  final String egyptiansNumber;
  final String childrenNumber;
  final String totalWithoutServices;
  final String total;
  final String vat;
  final String totalWithVat;
  final String cancellationDeadline;

  const TripDetails({
    super.key,
    required this.tripName,
    required this.bookingDate,
    required this.tripDate,
    required this.egyptiansNumber,
    required this.childrenNumber,
    required this.totalWithoutServices,
    required this.total,
    required this.vat,
    required this.totalWithVat,
    required this.cancellationDeadline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              tripName,
              style: TextStyles.font20BlackMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        15.verticalSpace,
        TripDetailsRow(
          label: 'Booking date',
          value: bookingDate,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'Trip Date',
          value: tripDate,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'Egyptians Number',
          value: egyptiansNumber,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'Children Number',
          value: childrenNumber,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'without additional services',
          value: totalWithoutServices,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'Total',
          value: total,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'VAT',
          value: vat,
        ),
        5.verticalSpace,
        TripDetailsRow(
          label: 'The total includes VAT',
          value: totalWithVat,
        ),
        15.verticalSpace,
        Text(
          'Cancellation Deadline: $cancellationDeadline',
          style: TextStyles.font18redMedium,
        ),
      ],
    );
  }
}
