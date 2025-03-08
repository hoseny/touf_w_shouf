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

class ValidateOtpForm extends StatefulWidget {
  final String email;
  final String? phone;
  final TextEditingController otpController;

  const ValidateOtpForm({
    super.key,
    required this.email,
    required this.phone,
    required this.otpController,
  });

  @override
  State<ValidateOtpForm> createState() => _ValidateOtpFormState();
}

class _ValidateOtpFormState extends State<ValidateOtpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValidateOtpPinPut(
            otpController: widget.otpController,
            onCompleted: (otp) {
              _onSubmitted(otp);
            },
          ),
          150.verticalSpace,
          BlocBuilder<ValidateOtpCubit, ValidateOtpState>(
            builder: (context, state) {
              return AppButton(
                onPressed: () {
                  _onSubmitted(widget.otpController.text);
                },
                width: 327.w,
                height: 46.h,
                text: 'Verify',
                isLoading: state is ValidateOtpLoading,
              );
            },
          ),
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
              if (state is ValidateOtpLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  void _onSubmitted(String otp) {
    if (_formKey.currentState!.validate()) {
      if (widget.phone != null) {
        context.read<ValidateOtpCubit>().validateOtp(
              validateOtpRequest: ValidateOtpRequest(
                otp: otp,
                email: widget.email,
                phone: widget.phone!,
              ),
            );
      } else {
        context.read<ValidateOtpForgetCubit>().validateOtpForget(
              request: ValidateOtpForgetRequest(vOtp: otp),
              email: widget.email,
            );
      }
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}
