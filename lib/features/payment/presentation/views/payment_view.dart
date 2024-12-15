import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/reservation/reservation_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.program});

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StepCubit()),
        BlocProvider(
          create: (context) => ProgramGroupCubit(
            getIt.get<PaymentRepoImpl>(),
            program,
          )..getGroup(
              programCode: program.code.toString(),
              programYear: program.programYear.toString(),
            ),
        ),
        BlocProvider(
          create: (context) => ReservationCubit(
            getIt.get<PaymentRepoImpl>(),
          ),
        ),
      ],
      child: const Scaffold(
        body: PaymentBody(),
      ),
    );
  }
}
