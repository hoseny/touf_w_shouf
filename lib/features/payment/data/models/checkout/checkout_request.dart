class CheckoutRequest {
  final String urlFalse;
  final String urlTrue;
  final String accessType;
  final int custRef;
  final int ressp;
  final int totalPrice;
  final String token;

  CheckoutRequest({
    required this.urlFalse,
    required this.urlTrue,
    required this.accessType,
    required this.custRef,
    required this.ressp,
    required this.totalPrice,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'urlFalse': urlFalse,
      'urlTrue': urlTrue,
      'accessType': accessType,
      'custRef': custRef,
      'invNo': ressp,
      'invAmount': totalPrice,
      'appSession': token,
    };
  }
}
