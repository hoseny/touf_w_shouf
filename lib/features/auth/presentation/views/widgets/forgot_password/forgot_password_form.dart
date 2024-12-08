import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordForm extends StatefulWidget {
  final TextEditingController emailController;

  const ForgotPasswordForm({super.key, required this.emailController});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    widget.emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (formKey.currentState?.validate() ?? false) {
      final email = widget.emailController.text.trim();
      context.read<ForgotPasswordCubit>().forgetPassword(email: email);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextFormField(
            hintText: "Insert email address",
            controller: widget.emailController,
            validator: Validation.validatePhoneOrEmail,
          ),
          SizedBox(height: 150.h),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return AppButton(
                onPressed: _submit,
                text: 'Submit',
                width: 327.w,
                height: 46.h,
                isLoading: state is ForgotPasswordLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
