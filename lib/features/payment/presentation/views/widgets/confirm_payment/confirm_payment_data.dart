import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data_row.dart';

class ConfirmPaymentData extends StatelessWidget {
  const ConfirmPaymentData({super.key,});


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgramGroupCubit>();
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          cubit.program.programName,
          style: TextStyles.font20BlackMedium,
        ),
        const ConfirmPaymentDataRow(
          title: 'Trip Date',
          value: '01/11/2024',
        ),
        const ConfirmPaymentDataRow(
          title: 'Program Year',
          value: '2024',
        ),
        const ConfirmPaymentDataRow(
          title: 'Customer Ref',
          value: '28',
        ),
        const ConfirmPaymentDataRow(
          title: 'Reservation Ref',
          value: '600967',
        ),
        const ConfirmPaymentDataRow(
          title: 'Reservation SP',
          value: '110',
        ),
        const ConfirmPaymentDataRow(
          title: 'Number of Adults',
          value: '1',
        ),
        const ConfirmPaymentDataRow(
          title: 'Number of Children (1-6)',
          value: '0',
        ),
        const ConfirmPaymentDataRow(
          title: 'Number of Children (6-12)',
          value: '0',
        ),
        const ConfirmPaymentDataRow(
          title: 'Total Without Additional Services',
          value: '850',
        ),
        const ConfirmPaymentDataRow(
          title: 'Additional Service Total',
          value: '0',
        ),
        const ConfirmPaymentDataRow(
          title: 'Total',
          value: '850',
        ),
        const ConfirmPaymentDataRow(
          title: 'VAT',
          value: '0',
        ),
        const ConfirmPaymentDataRow(
          title: 'Total with VAT',
          value: '850',
        ),
      ],
    );
  }
}
