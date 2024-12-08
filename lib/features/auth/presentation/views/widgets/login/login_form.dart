import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/fucntions.dart';
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
            hintText: "Email",
            controller: emailController,
            validator: (value) {
              return Validation.emailValidator(value);
            },
            autoValidateMode: autoValidateMode,
          ),
          15.verticalSpace,
          AppTextFormField(
            hintText: "Password",
            controller: passwordController,
            isPassword: true,
            validator: (value) {
              return Validation.loginPasswordValidator(value);
            },
            autoValidateMode: autoValidateMode,
          ),
          4.verticalSpace,
          AuthCustomCheckBox(
            mainText: "Remember information",
            isChecked: false,
            onChanged: (value) {},
          ),
          10.verticalSpace,
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is LoginLoading,
                onPressed: () {
                  unFocusAndCloseKeyboard(context);
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
                text: 'Login',
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
