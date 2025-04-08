import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/display_payment/display_payment_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data_row.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final DisplayPaymentCubit cubit = context.read<DisplayPaymentCubit>();
    return Column(
      spacing: 8.h,
      children: [
        Text(
          isEnglish(context) ? 'Trip Details' : 'تفاصيل الرحله',
          style: TextStyles.font20BlackMedium,
        ),
        ConfirmPaymentDataRow(
          title: isEnglish(context) ? 'Program Name' : 'اسم البرنامج',
          value: cubit.payment.programName,
        ),
        ConfirmPaymentDataRow(
          title: isEnglish(context) ? 'Reservation No' : 'رقم الحجز',
          value: cubit.payment.reservationSp.toString(),
        ),
        ConfirmPaymentDataRow(
          title: isEnglish(context) ? 'Date' : 'التاريخ',
          value: cubit.payment.tripDate,
        ),
      ],
    );
  }
}
