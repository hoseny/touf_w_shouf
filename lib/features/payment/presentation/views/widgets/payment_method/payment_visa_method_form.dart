import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/step_cubit/step_cubit.dart';
import 'payment_method_actions.dart';
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

  void _submitForm() {
    //TODO if (_formKey.currentState?.validate() ?? false) {
    //   context.read<StepCubit>().nextStep();
    // }
    context.read<StepCubit>().nextStep();
  }

  void _onCheckboxChanged(bool value) {
    setState(() {
      isSavePaymentDetails = value;
    });
  }

  void _onBack() {
    context.read<StepCubit>().previousStep();
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
            PaymentMethodInputField(
              label: 'Credit Card',
              hintText: '3485 **** **** ***',
              controller: cardController,
              validator: (value) => Validation.cardNumberValidator(value),
            ),
            20.verticalSpace,
            PaymentMethodInputField(
              label: 'Name on Card',
              hintText: 'Joe Doe',
              controller: nameController,
              validator: (value) => Validation.cardholderNameValidator(value),
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: PaymentMethodInputField(
                    label: 'Expiration Date',
                    hintText: 'MM/YY',
                    controller: expirationController,
                    validator: (value) => Validation.expirationDateValidator(value),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: PaymentMethodInputField(
                    label: 'CVV',
                    hintText: '123',
                    controller: cvvController,
                    isObscure: true,
                    validator: (value) => Validation.cvvValidator(value),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            PaymentMethodActions(
              isSavePaymentDetails: isSavePaymentDetails,
              onCheckboxChanged: _onCheckboxChanged,
              onSubmitForm: _submitForm,
              onBack: _onBack,
            ),
          ],
        ),
      ),
    );
  }
}
