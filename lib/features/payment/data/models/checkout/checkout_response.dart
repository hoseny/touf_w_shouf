class CheckoutResponse {
  final String checkout;

  CheckoutResponse({
    required this.checkout,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutResponse(
      checkout: json['checkout'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkout': checkout,
    };
  }
}
