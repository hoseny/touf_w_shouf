class LoginResponse {
  final int? custCode;
  final String? name;
  final String? telephone;
  final String? email;
  final String? token;

  LoginResponse({
    this.custCode,
    this.name,
    this.telephone,
    this.email,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final itemList = json['item'] as List<dynamic>;
    final firstItem = itemList.isNotEmpty ? itemList[0] : {};
    return LoginResponse(
      custCode: firstItem['CustCode'] as int?,
      name: firstItem['NAME'] as String?,
      telephone: firstItem['TELEPHONE'] as String?,
      email: firstItem['EMAIL'] as String?,
      token: (firstItem['Token '] as String?)?.trim() ?? '',
    );
  }

}
