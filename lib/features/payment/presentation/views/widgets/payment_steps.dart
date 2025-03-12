import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/checkout.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_step.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_step.dart';

class PaymentSteps extends StatelessWidget {
  const PaymentSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<StepCubit, int>(
        builder: (context, currentStep) {
          switch (currentStep) {
            case 0:
              return const PassengerDataStep();
            case 1:
              return const ConfirmPaymentStep();
            case 2:
              return const Checkout();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
