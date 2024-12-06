class ValidateOtpResponse {
  final String otp;
  final String otpStatus;

  ValidateOtpResponse({
    required this.otp,
    required this.otpStatus,
  });

  factory ValidateOtpResponse.fromJson(Map<String, dynamic> json) {
    return ValidateOtpResponse(
      otp: json['OTP'] ?? '',
      otpStatus: json['OTP Status']?? '',
    );
  }
}
