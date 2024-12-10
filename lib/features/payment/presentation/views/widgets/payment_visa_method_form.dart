import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'payment_input_field.dart';
import 'payment_save_details_check_box.dart';

class PaymentVisaMethodForm extends StatefulWidget {
  const PaymentVisaMethodForm({super.key});

  @override
  _PaymentVisaMethodFormState createState() => _PaymentVisaMethodFormState();
}

class _PaymentVisaMethodFormState extends State<PaymentVisaMethodForm> {
  final TextEditingController cardController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController expirationController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isSavePaymentDetails = false;

  @override
  void dispose() {
    cardController.dispose();
    nameController.dispose();
    expirationController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentInputField(
              label: 'Credit Card',
              hintText: '3485 **** **** ***',
              controller: cardController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter your card number'
                  : null,
            ),
            20.verticalSpace,
            PaymentInputField(
              label: 'Name on Card',
              hintText: 'Joe Doe',
              controller: nameController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter your name on the card'
                  : null,
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: PaymentInputField(
                    label: 'Expiration Date',
                    hintText: 'MM/YY',
                    controller: expirationController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter expiration date'
                        : null,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: PaymentInputField(
                    label: 'CVV',
                    hintText: '123',
                    controller: cvvController,
                    isObscure: true,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter CVV'
                        : null,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            PaymentSaveDetailsCheckbox(
              isChecked: isSavePaymentDetails,
              onChanged: (value) =>
                  setState(() => isSavePaymentDetails = value),
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {},
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
                    onPressed: () {},
                    text: 'Back',
                    width: 171.w,
                    height: 44.h,
                    variant: ButtonVariant.outlined,
                    textColor: AppColors.orange,
                    borderRadius: 5,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
