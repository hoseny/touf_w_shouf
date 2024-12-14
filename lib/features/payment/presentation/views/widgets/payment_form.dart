import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/reservation/reservation_request.dart';
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
    context.read<PaymentCubit>().getGroup(
          programCode: widget.program.code.toString(),
          programYear: widget.program.programYear.toString(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<PaymentCubit, PaymentState>(
        buildWhen: (previous, current) => current is GroupSuccess || current is GroupLoading || current is GroupFailure,
        builder: (context, state) {
          if (state is GroupLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GroupFailure) {
            return FailureState(
              message: state.errorMessage,
              onRetry: null,
            );
          } else if (state is GroupSuccess) {
            final groupPrice = state.groupPrice;
            final programGroup = state.programGroup;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                groupPrice.isNotEmpty
                    ? ServicesGroupCard(
                        title: 'Number of People',
                        services: groupPrice.map(
                          (pax) {
                            return ServiceSelectionTile(
                              label: pax.paxType,
                              description: '${pax.pPrice} EGP',
                              count: pax.count,
                              onIncrease: () => _updateCount(
                                groupPrice.indexOf(pax),
                                isIncrease: true,
                              ),
                              onDecrease: () => _updateCount(
                                groupPrice.indexOf(pax),
                                isIncrease: false,
                              ),
                            );
                          },
                        ).toList(),
                      )
                    : Center(
                        child: Text(
                          'Not Available',
                          style: TextStyles.font18OrangeMedium,
                        ),
                      ),
                BlocBuilder<PaymentCubit, PaymentState>(
                  buildWhen: (previous, current) => current is GroupSuccess,
                  builder: (context, _) {
                    final totalPrice = context.read<PaymentCubit>().calculateTotalPrice();
                    context.read<PaymentCubit>().totalPrice = totalPrice;
                    return PaymentTotalPrice(price: '$totalPrice EGP');
                  },
                ),
                20.verticalSpace,
                TermsAndConditionsWidget(
                  isChecked: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                20.verticalSpace,
                PaymentButtons(
                  onPayPressed: isChecked
                      ? () {
                          _insertReservation(
                            programGroup.progGrpNo.toString(),
                          );
                        }
                      : () {
                          ToastHelper.showErrorToast(
                            'Agree to terms and conditions',
                          );
                        },
                  onAddToCartPressed: isChecked ? () {} : null,
                ),
              ],
            );
          }

          return const FailureState(
            message: 'Something went wrong',
            onRetry: null,
          );
        },
      ),
    );
  }

  void _updateCount(int index, {required bool isIncrease}) {
    if (isIncrease) {
      context.read<PaymentCubit>().increaseCount(index);
    } else {
      context.read<PaymentCubit>().decreaseCount(index);
    }
  }

  void _insertReservation(String programGroupNumber) {
    context.read<PaymentCubit>().insertReservation(
          reservationRequest: ReservationRequest(
            custRef: SharedPref.getInt(key: SharedPrefKeys.custCode).toString(),
            telephone: SharedPref.getString(key: SharedPrefKeys.telephone),
            progGrpNo: programGroupNumber,
            progCode: widget.program.code.toString(),
            progYear: widget.program.programYear.toString(),
            lang: '1',
          ),
        );
  }
}
