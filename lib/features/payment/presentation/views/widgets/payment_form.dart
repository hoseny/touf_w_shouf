import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/payment/data/models/service_selection_data.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/payment_total_price.dart';
import 'services_group_card.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ServicesGroupCard(
            title: 'Number of People',
            services: [
              ServiceSelectionData(
                label: 'Baby',
                description: '20 EGP from 8 to 13 (year)',
                count: 2,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionData(
                label: 'Child',
                description: '30 EGP From 14 to 19 (year)',
                count: 1,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionData(
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
              ServiceSelectionData(
                label: 'Dinner',
                description: 'A Dinner meal in 5 starts resturant',
                count: 2,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionData(
                label: 'Bus',
                description: 'A Bus to drive you to your destination',
                count: 1,
                onIncrease: () {},
                onDecrease: () {},
              ),
              ServiceSelectionData(
                label: 'Adult',
                description: '50 EGP From 20 to 50 (year)',
                count: 3,
                onIncrease: () {},
                onDecrease: () {},
              ),
            ],
          ),
          PaymentTotalPrice(price: '2,550 EGP',)
        ],
      ),
    );
  }
}
