import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextFormField(
            hintText: isEnglish(context)
                ? "Insert email address"
                : "أدخل البريد الإلكتروني",
            controller: cubit.emailController,
            validator: (value) => Validation.validatePhoneOrEmail(context, value),
            onChanged: (value) => cubit.formKey.currentState!.validate(),
          ),
          SizedBox(height: 150.h),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return AppButton(
                onPressed: () {
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    final email = cubit.emailController.text.trim();
                    context
                        .read<ForgotPasswordCubit>()
                        .forgetPassword(email: email);
                  }
                },
                text: isEnglish(context) ? 'Submit' : 'تأكيد',
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
