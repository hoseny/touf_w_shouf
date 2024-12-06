class ResetPasswordRequest {
  final String email;
  final String otp;
  final int transactionNo;
  final String password;

  ResetPasswordRequest({
    required this.email,
    required this.otp,
    required this.transactionNo,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "Email": email,
      "V_OTP": otp,
      "TransNo": transactionNo,
      "Pass": password,
    };
  }
}
