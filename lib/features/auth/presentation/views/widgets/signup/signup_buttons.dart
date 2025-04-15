import 'package:easy_localization/easy_localization.dart' as context;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.watch<AuthCubit>();
    return AppButton(
      isLoading: cubit.state is SignUpLoading,
      onPressed: () {
        if (cubit.formKey.currentState!.validate() && cubit.isChecked) {
          cubit.signUp(
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
  }
}
