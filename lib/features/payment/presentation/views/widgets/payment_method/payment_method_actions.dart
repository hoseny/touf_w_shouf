import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'payment_method_check_box.dart';

class PaymentMethodActions extends StatelessWidget {
  final bool isSavePaymentDetails;
  final Function(bool) onCheckboxChanged;
  final VoidCallback onSubmitForm;
  final VoidCallback onBack;

  const PaymentMethodActions({
    super.key,
    required this.isSavePaymentDetails,
    required this.onCheckboxChanged,
    required this.onSubmitForm,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentMethodCheckBox(
          isChecked: isSavePaymentDetails,
          onChanged: onCheckboxChanged,
        ),
        20.verticalSpace,
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: onSubmitForm,
                text: 'Confirm',
                width: 171.w,
                height: 44.h,
                backgroundColor: AppColors.orange,
                borderRadius: 5,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppButton(
                onPressed: onBack,
                text: 'Back',
                width: 171.w,
                height: 44.h,
                variant: ButtonVariant.outlined,
                textColor: AppColors.orange,
                borderRadius: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
