import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_custom_check_box.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.watch<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextFormField(
                hintText: context.tr(LocaleKeys.authFirstName),
                controller: cubit.firstnameController,
                validator: (value) =>
                    Validation.userNameValidator(context, value),
              ),
              15.verticalSpace,
              AppTextFormField(
                hintText: context.tr(LocaleKeys.authLastName),
                controller: cubit.lastnameController,
                validator: (value) =>
                    Validation.userNameValidator(context, value),
              ),
              15.verticalSpace,
              AppTextFormField(
                hintText: context.tr(LocaleKeys.authEmail),
                controller: cubit.emailController,
                validator: (value) => Validation.emailValidator(context, value),
              ),
              15.verticalSpace,
              AppTextFormField(
                hintText: context.tr(LocaleKeys.authPhone),
                controller: cubit.phoneController,
                validator: (value) =>
                    Validation.phoneNumberValidator(context, value),
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
            ],
          ),
        );
      },
    );
  }
}
