import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
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
            hintText: context.tr(LocaleKeys.authFirstName),
            controller: _firstnameController,
            validator: (value) => Validation.userNameValidator(context, value),
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authLastName),
            controller: _lastnameController,
            validator: (value) => Validation.userNameValidator(context, value),
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authEmail),
            controller: widget.emailController,
            validator: (value) => Validation.emailValidator(context, value),
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authPhone),
            controller: widget.phoneController,
            validator: (value) =>
                Validation.phoneNumberValidator(context, value),
            keyboardType: TextInputType.phone,
            isPhoneField: true,
            autoValidateMode: _autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authPassword),
            controller: _passwordController,
            isPassword: true,
            validator: (value) =>
                Validation.loginPasswordValidator(context, value),
            autoValidateMode: _autoValidateMode,
          ),
          10.verticalSpace,
          AuthCustomCheckBox(
            isChecked: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value;
              });
            },
            textSpans: isEnglish(context)
                ? [
                    TextSpan(
                      text: "I agree to ",
                      style: TextStyles.font14Grey600Regular,
                    ),
                    TextSpan(
                      text: "Platform Terms of Service",
                      style: TextStyles.font14Blue500Bold,
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyles.font14Grey600Regular,
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyles.font14Blue500Bold,
                    ),
                  ]
                : [
                    TextSpan(
                      text: "أوافق على ",
                      style: TextStyles.font14Grey600Regular,
                    ),
                    TextSpan(
                      text: " شروط خدمة التطبيق",
                      style: TextStyles.font14Blue500Bold,
                    ),
                    TextSpan(
                      text: " و ",
                      style: TextStyles.font14Grey600Regular,
                    ),
                    TextSpan(
                      text: "سياسة الخصوصية",
                      style: TextStyles.font14Blue500Bold,
                    ),
                  ],
          ),
          10.verticalSpace,
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is SignUpLoading,
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
                      ToastHelper.showErrorToast(
                        isEnglish(context)
                            ? 'You must agree to the terms to create an account'
                            : 'يجب عليك الموافقة على الشروط لإنشاء حساب',
                      );
                    }
                  }
                },
                text: context.tr(LocaleKeys.authCreateAccount),
                width: 327.w,
                height: 46.h,
              );
            },
          )
        ],
      ),
    );
  }
}
