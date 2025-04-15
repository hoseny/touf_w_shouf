import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_forget_models/validate_otp_forget_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/validate_otp/validate_otp_pin_put.dart';

class ValidateOtpForm extends StatelessWidget {
  final String email;
  final String? phone;

  const ValidateOtpForm({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.watch<AuthCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValidateOtpPinPut(
            otpController: cubit.otpController,
            onCompleted: (otp) {
              _onSubmitted(context, otp);
            },
          ),
          150.verticalSpace,
          AppButton(
            onPressed: () {
              _onSubmitted(context, cubit.otpController.text);
            },
            width: 327.w,
            height: 46.h,
            text: 'Verify',
            isLoading: cubit.state is ValidateOtpLoading || cubit.state is ValidateOtpForgetLoading,
          ),
        ],
      ),
    );
  }

  void _onSubmitted(BuildContext context, String otp) {
    final AuthCubit cubit = context.read<AuthCubit>();
    if (cubit.formKey.currentState!.validate()) {
      if (phone != null) {
        cubit.validateOtp(
          validateOtpRequest: ValidateOtpRequest(
            otp: otp,
            email: email,
            phone: phone!,
          ),
        );
      } else {
        cubit.validateOtpForget(
          request: ValidateOtpForgetRequest(vOtp: otp),
          email: email,
        );
      }
    }
  }
}
