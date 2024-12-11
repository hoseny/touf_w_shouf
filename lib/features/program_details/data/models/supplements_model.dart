class SupplementsModel {
  final String code;
  final String thePriceIncludesSupplement;

  SupplementsModel({
    required this.code,
    required this.thePriceIncludesSupplement,
  });

  factory SupplementsModel.fromJson(Map<String, dynamic> json) {
    return SupplementsModel(
      code: json['code'] ?? 'Unknown',
      thePriceIncludesSupplement: json['the_price_includes_supplement'] ?? 'No information available',
    );
  }
}
