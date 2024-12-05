import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_custom_check_box.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
            controller: _emailController,
            validator: Validation.emailValidator,
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: "Phone number",
            controller: _phoneController,
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
            isChecked: false,
            onChanged: (value) {
            },
          ),
          10.verticalSpace,
          AppButton(
            onPressed: () {},
            text: 'Create account',
            width: 327.w,
            height: 46.h,
          )
        ],
      ),
    );
  }
}
