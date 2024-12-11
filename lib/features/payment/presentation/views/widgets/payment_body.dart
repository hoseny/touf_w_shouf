import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';
import 'payment_form.dart';
import 'payment_header.dart';
import 'payment_method/payment_method_tab_bar.dart';
import 'payment_step_indicator.dart';
import 'success/success_body.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepCubit, StepStates>(
      builder: (context, state) {
        int currentStep = 1;
        if (state is StepUpdated) {
          currentStep = state.currentStep;
        } else if (state is StepInitial) {
          currentStep = state.currentStep;
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const PaymentHeader(),
            PaymentStepIndicator(
              currentStep: currentStep,
            ),
            _getStepBody(context, currentStep),
          ],
        );
      },
    );
  }

  Widget _getStepBody(BuildContext context, int currentStep) {
    switch (currentStep) {
      case 1:
        return const PaymentForm();
      case 2:
        return const PaymentMethodTabBar();
      case 3:
        return const SuccessBody();
      default:
        return Container();
    }
  }
}
