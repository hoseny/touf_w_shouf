class DetailsReservationResponse {
  final String insert;

  DetailsReservationResponse({required this.insert});

  factory DetailsReservationResponse.fromJson(Map<String, dynamic> json) {
    return DetailsReservationResponse(
      insert: json['Insert '] ?? '',
    );
  }

}
