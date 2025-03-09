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

class SignUpForm extends StatelessWidget {

  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authFirstName),
            controller: cubit.firstnameController,
            validator: (value) => Validation.userNameValidator(context, value),
            onChanged: (value) => cubit.formKey.currentState!.validate(),
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authLastName),
            controller: cubit.lastnameController,
            validator: (value) => Validation.userNameValidator(context, value),
            onChanged: (value) => cubit.formKey.currentState!.validate(),
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authEmail),
            controller: cubit.emailController,
            validator: (value) => Validation.emailValidator(context, value),
            onChanged: (value) => cubit.formKey.currentState!.validate(),
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authPhone),
            controller: cubit.phoneController,
            validator: (value) => Validation.phoneNumberValidator(context, value),
            onChanged: (value) => cubit.formKey.currentState!.validate(),
            keyboardType: TextInputType.phone,
            isPhoneField: true,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authPassword),
            controller: cubit.passwordController,
            isPassword: true,
            validator: (value) =>
                Validation.loginPasswordValidator(context, value),
            onChanged: (value) => cubit.formKey.currentState!.validate(),
          ),
          10.verticalSpace,
          AuthCustomCheckBox(
            isChecked: cubit.isChecked,
            onChanged: (value) {
              cubit.toggleCheckbox(value);
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
                  if (cubit.formKey.currentState!.validate() &&
                      cubit.isChecked) {
                    context.read<SignUpCubit>().signUp(
                          signUpRequest: SignUpRequest(
                            phone: cubit.phoneController.text.trim(),
                            email: cubit.emailController.text.trim(),
                            userName:
                                "${cubit.firstnameController.text.trim()} ${cubit.lastnameController.text.trim()}",
                            password: cubit.passwordController.text.trim(),
                            nat: "1",
                            address: "address",
                          ),
                        );
                  } else if (!cubit.isChecked) {
                    ToastHelper.showErrorToast(
                      isEnglish(context)
                          ? 'You must agree to the terms to create an account'
                          : 'يجب عليك الموافقة على الشروط لإنشاء حساب',
                    );
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
