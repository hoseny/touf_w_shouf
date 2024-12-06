class ValidateOtpForgetRequest {
  final String vOtp;

  ValidateOtpForgetRequest({required this.vOtp});

  Map<String, dynamic> toJson() {
    return {
      "V_OTP": vOtp,
    };
  }
}
