class ReviewModel {
  final String review;
  final int rate;
  final String customer;

  ReviewModel({
    required this.review,
    required this.rate,
    required this.customer,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      review: json['review'] ?? 'No Review',
      rate: json['rate'] ?? 0,
      customer: json['customer'] ?? 'Unknown',
    );
  }
}
