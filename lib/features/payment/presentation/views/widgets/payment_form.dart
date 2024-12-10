import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_total_price.dart';
import 'payment_buttons.dart';
import 'payment_method_tab_bar.dart';
import 'service_selection_tile.dart';
import 'services_group_card.dart';
import 'terms_and_conditions.dart';

class PaymentForm extends StatefulWidget {
  final VoidCallback onPay;

  const PaymentForm({super.key, required this.onPay});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  bool isChecked = false;
  bool showPaymentMethod = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ServicesGroupCard(
            title: 'Number of People',
            services: [
              ServiceSelectionTile(
                label: 'Baby',
                description: '20 EGP from 8 to 13 (year)',
                count: 2,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionTile(
                label: 'Child',
                description: '30 EGP From 14 to 19 (year)',
                count: 1,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionTile(
                label: 'Adult',
                description: '50 EGP From 20 to 50 (year)',
                count: 3,
                onIncrease: () {},
                onDecrease: () {},
              ),
            ],
          ),
          ServicesGroupCard(
            title: 'Additional Services',
            services: [
              ServiceSelectionTile(
                label: 'Dinner',
                description: 'A Dinner meal in 5 stars restaurant',
                count: 2,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionTile(
                label: 'Bus',
                description: 'A Bus to drive you to your destination',
                count: 1,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionTile(
                label: 'Adult',
                description: '50 EGP From 20 to 50 (year)',
                count: 3,
                onIncrease: () {},
                onDecrease: () {},
              ),
            ],
          ),
          PaymentTotalPrice(price: '2,550 EGP'),
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
                    setState(() {
                      showPaymentMethod = true;
                    });
                    widget.onPay();
                  }
                : null,
            onAddToCartPressed: isChecked ? () {} : null,
          ),
          if (showPaymentMethod) ...[
            20.verticalSpace,
            const PaymentMethodTabBar(),
          ],
        ],
      ),
    );
  }
}
