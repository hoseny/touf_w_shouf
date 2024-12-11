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
      review: json['review'] as String,
      rate: json['rate'] as int,
      customer: json['customer'] as String,
    );
  }
}
