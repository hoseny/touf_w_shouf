import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/my_reservation_tab_bar.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/my_reservations/my_reservation_tabs_content.dart';

class MyReservationsBody extends StatelessWidget {
  const MyReservationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyReservationsTabBar(),
        MyReservationTabsContent(),
      ],
    );
  }
}
