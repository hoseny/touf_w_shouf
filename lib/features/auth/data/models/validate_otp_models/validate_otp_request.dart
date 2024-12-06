class ValidateOtpRequest {
  final String email;
  final String phone;
  final String otp;


  ValidateOtpRequest({
    required this.email,
    required this.phone,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'OTP': otp,
      'p_Mail': email,
      'TEL': phone,
    };
  }
}
