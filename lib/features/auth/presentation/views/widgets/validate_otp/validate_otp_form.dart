import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_forget_models/validate_otp_forget_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/validate_otp_models/validate_otp_request.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/validate_otp_forget_cubit/validate_otp_forget_cubit.dart';
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
    final cubit = context.read<ValidateOtpCubit>();
    return Form(
      key: cubit.formKey,
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
          BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
            listener: (context, state) {
              if (state is ValidateOtpFailure) {
                ToastHelper.showErrorToast(state.errMessage);
              } else if (state is ValidateOtpSuccess) {
                ToastHelper.showSuccessToast(
                  isEnglish(context)
                      ? 'OTP Verified Successfully!'
                      : 'تم التحقق من الكود بنجاح',
                );
              }
            },
            builder: (context, state) {
              return AppButton(
                onPressed: () {
                  _onSubmitted(context, cubit.otpController.text);
                },
                width: 327.w,
                height: 46.h,
                text: 'Verify',
                isLoading: state is ValidateOtpLoading,
              );
            },
          ),
        ],
      ),
    );
  }

  void _onSubmitted(BuildContext context, String otp) {
    final cubit = context.read<ValidateOtpCubit>();
    if (cubit.formKey.currentState!.validate()) {
      if (phone != null) {
        context.read<ValidateOtpCubit>().validateOtp(
              validateOtpRequest: ValidateOtpRequest(
                otp: otp,
                email: email,
                phone: phone!,
              ),
            );
      } else {
        context.read<ValidateOtpForgetCubit>().validateOtpForget(
              request: ValidateOtpForgetRequest(vOtp: otp),
              email: email,
            );
      }
    }
  }
}
