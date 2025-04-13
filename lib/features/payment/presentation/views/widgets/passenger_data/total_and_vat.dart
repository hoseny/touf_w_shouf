import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';

class TotalAndVat extends StatelessWidget {
  const TotalAndVat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isEnglish(context) ? "Total" : "المجموع",
                style: TextStyles.font24BlackMedium,
              ),
              BlocBuilder<ProgramGroupCubit, ProgramGroupState>(
                builder: (context, state) {
                  final cubit = context.read<ProgramGroupCubit>();
                  return Text(
                    cubit.calculateTotalPrice().toStringAsFixed(2),
                    style: TextStyles.font24BlackMedium,
                  );
                },
              )
            ],
          ),
          Row(
            children: [
              Text(
                isEnglish(context)
                    ? "The total includes VAT"
                    : "المجموع يشمل الضريبة",
                style: TextStyles.font20OrangeMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
