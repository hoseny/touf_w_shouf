import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/validations/validation.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/core/widgets/app_text_form_field.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.watch<AuthCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextFormField(
            hintText: isEnglish(context)
                ? "Insert email address"
                : "أدخل البريد الإلكتروني",
            controller: cubit.emailController,
            validator: (value) => Validation.validatePhoneOrEmail(context, value),
          ),
          150.verticalSpace,
          AppButton(
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                final email = cubit.emailController.text.trim();
                cubit.forgetPassword(email: email);
              }
            },
            text: isEnglish(context) ? 'Submit' : 'تأكيد',
            width: 327.w,
            height: 46.h,
            isLoading: cubit.state is ForgotPasswordLoading,
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
