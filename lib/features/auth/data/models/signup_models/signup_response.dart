class SignUpResponse {
  final List<Item> items;

  SignUpResponse({required this.items});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      items: (json['item'] as List)
          .map((e) => Item.fromJson(e))
          .toList(),
    );
  }
}

class Item {
  final String? otp;

  Item({this.otp});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      otp: json['OTP'] as String?,
    );
  }
}
