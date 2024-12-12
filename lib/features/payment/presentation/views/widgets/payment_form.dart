import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/details_reservation/details_reservation_request.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
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
            buildWhen: (previous, current) =>
                current is GroupPriceSuccess ||
                current is GroupPriceLoading ||
                current is GroupPriceFailure,
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
                context.read<PaymentCubit>().totalPrice = totalPrice;
                return PaymentTotalPrice(price: '$totalPrice EGP');
              }
              return PaymentTotalPrice(
                price: '${context.read<PaymentCubit>().totalPrice} EGP',
              );
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
                    //context.read<StepCubit>().nextStep();
                    context.read<PaymentCubit>().insertDetailsReservation(
                          detailsReservationRequest: DetailsReservationRequest(
                            custRef: SharedPref.getInt(
                              key: SharedPrefKeys.custCode,
                            ).toString(),
                            telephone: SharedPref.getString(
                              key: SharedPrefKeys.telephone,
                            ),
                            progGrpNo: '1',
                            progCode: widget.program.code.toString(),
                            progYear: widget.program.programYear,
                            paxType: 'CHILD FROM 6 TO 12',
                            paxCount: 2,
                          ),
                        );
                  }
                : () {
                    ToastHelper.showErrorToast('Agree to terms and conditions');
                  },
            onAddToCartPressed: isChecked ? () {} : null,
          ),
        ],
      ),
    );
  }
}
