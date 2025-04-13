import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/custom_drop_down.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/drop_down_bloc_builder.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_buttons.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/passenger_data_list_bloc_builder.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/terms_and_conditions.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/total_and_vat.dart';

class PassengerDataStep extends StatelessWidget {
  const PassengerDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child:  const Column(
        children: [
          DropDownBlocBuilder(),
           PassengerDataListBlocBuilder(),
          TotalAndVat(),
          TermsAndConditions(),
          PassengerDataButtons(),
        ],
      ),
    );
  }
}
