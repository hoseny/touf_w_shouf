class LoginResponse {
  final int custCode;
  final String name;
  final String telephone;
  final String email;
  final String token;

  LoginResponse({
    required this.custCode,
    required this.name,
    required this.telephone,
    required this.email,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      custCode: json['CustCode'] as int,
      name: json['NAME'] as String,
      telephone: json['TELEPHONE'] as String,
      email: json['EMAIL'] as String,
      token: json['Token '],
    );
  }
}