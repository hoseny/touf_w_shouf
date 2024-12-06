import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  const ValidateOtpForm({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  State<ValidateOtpForm> createState() => _ValidateOtpFormState();
}

class _ValidateOtpFormState extends State<ValidateOtpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValidateOtpPinPut(
            otpController: _otpController,
            onCompleted: (otp) {
              _onSubmitted(otp);
            },
          ),
          150.verticalSpace,
          AppButton(
            onPressed: () {
              _onSubmitted(_otpController.text);
            },
            width: 327.w,
            height: 46.h,
            text: 'Verify',
          ),
          BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
            listener: (context, state) {
              if (state is ValidateOtpFailure) {
                ToastHelper.showErrorToast(state.errMessage);
              } else if (state is ValidateOtpSuccess) {
                ToastHelper.showSuccessToast('OTP Verified Successfully!');
              }
            },
            builder: (context, state) {
              if (state is ValidateOtpLoading) {
                return Center(child: CircularProgressIndicator());
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
        // Normal OTP validation with email and phone
        context.read<ValidateOtpCubit>().validateOtp(
              validateOtpRequest: ValidateOtpRequest(
                otp: otp,
                email: widget.email,
                phone: widget.phone!,
              ),
            );
      } else {
        // OTP validation for forgot password with email only
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
