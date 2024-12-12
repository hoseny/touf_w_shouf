class InsertReviewRequest {
  final int cust;
  final String rate;
  final String review;

  InsertReviewRequest({required this.review, required this.rate, required this.cust});

  Map<String, dynamic> toJson() => {
        'cust': cust,
        'rate': rate,
        'review': review,
      };
}