import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/login_cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autoValidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextFormField(
                hintText: context.tr(LocaleKeys.authEmail),
                controller: cubit.emailController,
                validator: (value) => Validation.emailValidator(context, value),
              ),
              15.verticalSpace,
              AppTextFormField(
                hintText: context.tr(LocaleKeys.authPassword),
                controller: cubit.passwordController,
                isPassword: true,
                validator: (value) => Validation.loginPasswordValidator(context, value),
              ),
              10.verticalSpace,
              AppButton(
                isLoading: state is LoginLoading,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          loginRequest: LoginRequest(
                            email: cubit.emailController.text.trim(),
                            password: cubit.passwordController.text.trim(),
                          ),
                        );
                  } else {
                    cubit.enableAutoValidate();
                  }
                },
                text: context.tr(LocaleKeys.authLogin),
                width: 327.w,
                height: 46.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
