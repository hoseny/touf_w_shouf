import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_tile.dart';

class PassengerDataStep extends StatelessWidget {
  const PassengerDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: const Column(
        children: [
          PassengerDataTile(),
        ],
      ),
    );
  }
}


