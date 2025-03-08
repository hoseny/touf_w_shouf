import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_custom_check_box.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authEmail),
            controller: emailController,
            validator: (value) => Validation.emailValidator(context, value),
            autoValidateMode: autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: context.tr(LocaleKeys.authPassword),
            controller: passwordController,
            isPassword: true,
            validator: (value) =>
                Validation.loginPasswordValidator(context, value),
            autoValidateMode: autoValidateMode,
          ),
          4.verticalSpace,
          AuthCustomCheckBox(
            isChecked: false,
            onChanged: (value) {},
            textSpans: [
              TextSpan(
                text: context.tr(LocaleKeys.authRemember),
                style: TextStyles.font14Grey600Regular,
              ),
            ],
          ),
          10.verticalSpace,
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is LoginLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          loginRequest: LoginRequest(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: context.tr(LocaleKeys.authLogin),
                width: 327.w,
                height: 46.h,
              );
            },
          ),
        ],
      ),
    );
  }
}
