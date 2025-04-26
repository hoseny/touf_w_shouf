import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/paid_reservations_bloc_builder.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/unpaid_reservations_bloc_builder.dart';

class MyReservationTabsContent extends StatelessWidget {
  const MyReservationTabsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    switch (cubit.state.reservationTabIndex) {
      case 0:
        return const PaidReservationsBlocBuilder();
      case 1:
        return const UnpaidReservationsBlocBuilder();
      default:
        return Container();
    }
  }
}
