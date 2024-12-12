import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_total_price.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_buttons.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/service_selection_tile.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/services_group_card.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/terms_and_conditions.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key, required this.program});

  final ProgramModel program;

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // Fetch group prices when the widget is initialized
    context.read<PaymentCubit>().getGroupPrice(
          programCode: widget.program.code.toString(),
          programYear: widget.program.programYear.toString(),
          groupNumber: '1',
        );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              if (state is GroupPriceSuccess) {
                final groupPrice = state.groupPrice;

                return groupPrice.isNotEmpty
                    ? ServicesGroupCard(
                        title: 'Number of People',
                        services: groupPrice.map((pax) {
                          return ServiceSelectionTile(
                            label: pax.paxType,
                            description: '${pax.pPrice} EGP',
                            count: pax.count,
                            onIncrease: () {
                              context.read<PaymentCubit>().increaseCount(
                                    groupPrice.indexOf(pax),
                                  );
                            },
                            onDecrease: () {
                              context.read<PaymentCubit>().decreaseCount(
                                    groupPrice.indexOf(pax),
                                  );
                            },
                          );
                        }).toList(),
                      )
                    : Center(
                        child: Text(
                          'Not Available',
                          style: TextStyles.font18OrangeMedium,
                        ),
                      );
              } else if (state is GroupPriceLoading) {
                return const CircularProgressIndicator();
              } else if (state is GroupPriceFailure) {
                return FailureState(
                  message: state.errorMessage,
                  onRetry: () {
                    context.read<PaymentCubit>().getGroupPrice(
                          programCode: widget.program.code.toString(),
                          programYear: widget.program.programYear.toString(),
                          groupNumber: '1',
                        );
                  },
                );
              } else {
                return FailureState(
                  message: 'Something went wrong',
                  onRetry: () {
                    context.read<PaymentCubit>().getGroupPrice(
                          programCode: widget.program.code.toString(),
                          programYear: widget.program.programYear.toString(),
                          groupNumber: '1',
                        );
                  },
                );
              }
            },
          ),
          // ServicesGroupCard(
          //   title: 'Additional Services',
          //   services: [
          //     ServiceSelectionTile(
          //       label: 'Dinner',
          //       description: 'A Dinner meal in 5 stars restaurant',
          //       count: 2,
          //       onIncrease: () {},
          //       onDecrease: () {},
          //     ),
          //     ServiceSelectionTile(
          //       label: 'Bus',
          //       description: 'A Bus to drive you to your destination',
          //       count: 1,
          //       onIncrease: () {},
          //       onDecrease: () {},
          //     ),
          //   ],
          // ),
          BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              if (state is GroupPriceSuccess) {
                final totalPrice =
                    context.read<PaymentCubit>().calculateTotalPrice();
                return PaymentTotalPrice(price: '$totalPrice EGP');
              }
              return const PaymentTotalPrice(price: '0 EGP');
            },
          ),
          20.verticalSpace,
          TermsAndConditionsWidget(
            isChecked: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          20.verticalSpace,
          PaymentButtons(
            onPayPressed: isChecked
                ? () {
                    context.read<StepCubit>().nextStep();
                  }
                : null,
            onAddToCartPressed: isChecked ? () {} : null,
          ),
        ],
      ),
    );
  }
}
