class ValidateOtpForgetResponse {
  final int? transactionNo;
  final String otp;

  ValidateOtpForgetResponse({
    this.transactionNo,
    required this.otp,
  });

  factory ValidateOtpForgetResponse.fromJson(Map<String, dynamic> json) {
    return ValidateOtpForgetResponse(
      transactionNo: json["TransactionNo"],
      otp: json["OTP"] ?? "",
    );
  }
}
