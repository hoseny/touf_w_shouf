class ForgotPasswordResponse {
  final List<Item> items;

  ForgotPasswordResponse({required this.items});


  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      items: (json['item'] as List)
          .map((e) => Item.fromJson(e))
          .toList(),
    );
  }
}

class Item {
  final String? error;
  final String? otp;

  Item({this.error, this.otp});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      error: json['Error'] as String?,
      otp: json['OTP'] as String?,
    );
  }
}
