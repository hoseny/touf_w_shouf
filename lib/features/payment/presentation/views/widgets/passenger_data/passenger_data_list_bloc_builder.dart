import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/additional_services.dart';
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Text(
                          'Pax Available: ${context.read<ProgramGroupCubit>().programGroup.paxAval}',
                          style: TextStyles.font18BlackMedium,
                        ),
                      ),
                      PassengerDataList(
                        groupPrice: state.services!.groupPrice,
                      ),
                      if (state.services!.additionalServices.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              child: Text(
                                'Additional Services',
                                style: TextStyles.font18BlackMedium,
                              ),
                            ),
                            AdditionalServices(
                              additionalServices: state.services!.additionalServices,
                            ),
                          ],
                        ),
                    ],
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
                default:
                  return const SizedBox.shrink();
              }
            },
          )
        : const SizedBox.shrink();
  }
}
