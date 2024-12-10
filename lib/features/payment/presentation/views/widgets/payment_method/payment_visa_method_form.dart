import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'payment_method_check_box.dart';
import 'payment_method_input_field.dart';

class PaymentVisaMethodForm extends StatefulWidget {
  const PaymentVisaMethodForm({super.key});

  @override
  PaymentVisaMethodFormState createState() => PaymentVisaMethodFormState();
}

class PaymentVisaMethodFormState extends State<PaymentVisaMethodForm> {
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

  // Method for form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      //TODO Process the form data here
      context.pushNamed(Routes.successView);
    } else {
      // If the form is invalid, show an error message
      context.pushNamed(Routes.successView);
    }
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
            // Credit Card input field
            PaymentMethodInputField(
              label: 'Credit Card',
              hintText: '3485 **** **** ***',
              controller: cardController,
              validator: (value) {
                return Validation.cardNumberValidator(value);
              },
            ),
            20.verticalSpace,
            PaymentMethodInputField(
              label: 'Name on Card',
              hintText: 'Joe Doe',
              controller: nameController,
              validator: (value) {
                return Validation.cardholderNameValidator(value);
              },
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: PaymentMethodInputField(
                    label: 'Expiration Date',
                    hintText: 'MM/YY',
                    controller: expirationController,
                    validator: (value) {
                      return Validation.expirationDateValidator(value);
                    },
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: PaymentMethodInputField(
                    label: 'CVV',
                    hintText: '123',
                    controller: cvvController,
                    isObscure: true,
                    validator: (value) {
                      return Validation.cvvValidator(value);
                    },
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            PaymentMethodCheckBox(
              isChecked: isSavePaymentDetails,
              onChanged: (value) =>
                  setState(() => isSavePaymentDetails = value),
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: _submitForm,
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
                    onPressed: () {
                      context.pop();
                    },
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
        ),
      ),
    );
  }
}
