import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/custom_text_field.dart';
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
          CustomTextField(
            hintText: "Email",
            controller: emailController,
            validator: (value) {
              return Validation.emailValidator(value);
            },
            autoValidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Password",
            controller: passwordController,
            isPassword: true,
            validator: (value) {
              return Validation.loginPasswordValidator(value);
            },
            autoValidateMode: autoValidateMode,
          ),
          4.verticalSpace,
          CustomCheckbox(
            mainText: "Remember information",
            isChecked: false,
            onChanged: (value) {},
          ),
          10.verticalSpace,
          AppButton(
            onPressed: () {},
            text: 'Login',
            width: 327.w,
            height: 46.h,
          )
        ],
      ),
    );
  }
}
