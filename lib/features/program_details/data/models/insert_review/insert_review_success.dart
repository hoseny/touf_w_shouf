class InsertReviewResponse {
  final String message;

  InsertReviewResponse({required this.message});

  factory InsertReviewResponse.fromJson(Map<String, dynamic> json) {
    return InsertReviewResponse(
      message: json['Review'] as String,
    );
  }
}
