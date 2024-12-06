import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_custom_check_box.dart';
class SignUpForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const SignUpForm({
    super.key,
    required this.emailController,
    required this.phoneController,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool _isChecked = false;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextFormField(
            hintText: "First name",
            controller: _firstnameController,
            validator: Validation.userNameValidator,
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: "Last name",
            controller: _lastnameController,
            validator: Validation.userNameValidator,
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: "Email",
            controller: widget.emailController,
            validator: Validation.emailValidator,
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: "Phone number",
            controller: widget.phoneController,
            validator: Validation.phoneNumberValidator,
            keyboardType: TextInputType.phone,
            isPhoneField: true,
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: "Password",
            controller: _passwordController,
            isPassword: true,
            validator: Validation.loginPasswordValidator,
            autoValidateMode: _autoValidateMode,
          ),
          10.verticalSpace,
          AuthCustomCheckBox(
            mainText: "I agree to Platform Terms of Service and Privacy Policy",
            highlightedParts: ["Terms", "of", "Service", "Privacy", "Policy"],
            isChecked: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value;
              });
            },
          ),
          10.verticalSpace,
          AppButton(
            onPressed: () {
              if (_formKey.currentState!.validate() && _isChecked) {
                context.read<SignUpCubit>().signUp(
                  signUpRequest: SignUpRequest(
                    phone: widget.phoneController.text.trim(),
                    email: widget.emailController.text.trim(),
                    userName:
                    "${_firstnameController.text.trim()} ${_lastnameController.text.trim()}",
                    password: _passwordController.text.trim(),
                    nat: "1",
                    address: "address",
                  ),
                );
              } else {
                setState(() {
                  _autoValidateMode = AutovalidateMode.always;
                });
                if (!_isChecked) {
                  ToastHelper.showErrorToast('You must agree to the terms to create an account');
                }
              }
            },
            text: 'Create account',
            width: 327.w,
            height: 46.h,
          )
        ],
      ),
    );
  }
}
