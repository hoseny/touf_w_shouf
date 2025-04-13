import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_list.dart';

class PassengerDataListBlocBuilder extends StatelessWidget {
  const PassengerDataListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgramGroupCubit>();
    return cubit.state.groupPriceStatus != GroupPriceStatus.loading
        ? BlocBuilder<ProgramGroupCubit, ProgramGroupState>(
            builder: (context, state) {
              switch (state.groupPriceStatus) {
                case GroupPriceStatus.initial:
                  return SizedBox(
                    height: 120.h,
                    child: Center(
                      child: Text(
                        'Please Pick a Date',
                        style: TextStyles.font18BlackMedium,
                      ),
                    ),
                  );
                case GroupPriceStatus.loading:
                  return SizedBox(
                    height: 120.h,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
                  );
                case GroupPriceStatus.success:
                  return PassengerDataList(
                    groupPrice: state.groupPrice!,
                  );

                case GroupPriceStatus.failure:
                  return SizedBox(
                    height: 200.h,
                    child: Center(
                      child: FailureState(
                        message: state.errorMessage,
                      ),
                    ),
                  );
              }
            },
          )
        : const SizedBox.shrink();
  }
}
