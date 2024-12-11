import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/widgets/app_bar.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StepCubit(), // Provide StepCubit to the widget tree
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Book Now'),
        body: PaymentBody(), // PaymentBody is where the Cubit is used
      ),
    );
  }
}
