import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/increment_decrement_buttons.dart';

class PassengerDataTile extends StatelessWidget {
  const PassengerDataTile({
    super.key,
    required this.groupPrice,
    required this.index,
  });

  final int index;
  final GroupPrice groupPrice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 0,
      ),
      title: Text(
        groupPrice.paxType,
        style: TextStyles.font16BlackMedium,
      ),
      subtitle: Text(
        groupPrice.pPrice.toString(),
        style: TextStyles.font14deepTealRegular,
      ),
      trailing: IncrementDecrementButtons(
        index: index,
      ),
    );
  }
}
