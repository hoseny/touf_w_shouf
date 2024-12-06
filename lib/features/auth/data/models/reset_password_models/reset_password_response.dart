class ResetPasswordResponse {
  final String passwordStatus;

  ResetPasswordResponse({
    required this.passwordStatus,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      passwordStatus: json["PassWord_Status"] ?? "",
    );
  }
}
