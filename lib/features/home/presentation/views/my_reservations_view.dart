import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/my_reservations_body.dart';

class MyReservationsView extends StatelessWidget {
  const MyReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final HomeCubit cubit = getIt.get<HomeCubit>();
        cubit.getPaidReservations();
        return cubit;
      },
      child: const Scaffold(
        body: SafeArea(
          child: MyReservationsBody(),
        ),
      ),
    );
  }
}
