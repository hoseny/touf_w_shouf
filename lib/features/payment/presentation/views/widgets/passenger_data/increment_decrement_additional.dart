import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/count_button.dart';

class IncrementDecrementAdditional extends StatelessWidget {
  const IncrementDecrementAdditional({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ultraLightGrey,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: BlocBuilder<ProgramGroupCubit, ProgramGroupState>(
        builder: (context, state) {
          final cubit = context.read<ProgramGroupCubit>();
          final count = (state.services?.additionalServices.length ?? 0) > index
              ? state.services!.additionalServices[index].count
              : 0;

          return Row(
            spacing: 12.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              CountButton(
                icon: Icons.remove,
                onTap: () => cubit.decreaseAdditionalServiceCount(index),
              ),
              Text(
                count.toString(),
                style: TextStyles.font14FadedGreyMedium,
              ),
              CountButton(
                icon: Icons.add,
                onTap: () => cubit.increaseAdditionalServiceCount(index),
              ),
            ],
          );
        },
      ),
    );
  }
}
