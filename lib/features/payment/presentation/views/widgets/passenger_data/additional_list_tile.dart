import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/data/models/services_model.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/passenger_data/increment_decrement_additional.dart';

class AdditionalListTile extends StatelessWidget {
  const AdditionalListTile({
    super.key,
    required this.service,
    required this.index,
  });

  final int index;
  final AdditionalService service;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 0,
      ),
      title: Text(
        service.pCategory,
        style: TextStyles.font16BlackMedium,
      ),
      subtitle: Text(
        service.extPrice.toString(),
        style: TextStyles.font14deepTealRegular,
      ),
      trailing: IncrementDecrementAdditional(
        index: index,
      ),
    );
  }
}
