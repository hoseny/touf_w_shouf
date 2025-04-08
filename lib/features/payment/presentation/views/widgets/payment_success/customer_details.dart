import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/payment/presentation/views/widgets/confirm_payment/confirm_payment_data_row.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Text(
          isEnglish(context) ? 'Customer Details' : 'تفاصيل العميل',
          style: TextStyles.font20BlackMedium,
        ),
        ConfirmPaymentDataRow(
          title: isEnglish(context) ? 'Customer Name' : 'اسم العميل',
          value: SharedPref.getString(key: SharedPrefKeys.customerName),
        ),
        ConfirmPaymentDataRow(
          title: isEnglish(context) ? 'Phone' : 'رقم الهاتف',
          value: SharedPref.getString(key: SharedPrefKeys.telephone),
        ),
        ConfirmPaymentDataRow(
          title: isEnglish(context) ? 'Email' : 'الايميل',
          value: SharedPref.getString(key: SharedPrefKeys.customerEmail),
        ),
      ],
    );
  }
}
