import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_state.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/reservations_list.dart';

class UnpaidReservationsBlocBuilder extends StatelessWidget {
  const UnpaidReservationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.unPaidReservationStatus == UnPaidReservationStatus.loading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            ),
          );
        } else if (state.unPaidReservationStatus == UnPaidReservationStatus.success) {
          return ReservationsList(
            reservations: state.unPaidReservations!,
          );
        } else if (state.unPaidReservationStatus == UnPaidReservationStatus.failure) {
          return Expanded(
            child: Center(
              child: FailureState(
                message: state.errorMessage,
                onRetry: () => context.read<HomeCubit>().getPaidReservations(),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
