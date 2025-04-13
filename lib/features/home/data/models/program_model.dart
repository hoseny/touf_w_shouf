class ProgramModel {
  final int code;
  final String programName;
  final int programYear;
  final num startPrice;
  final String imgPath;
  final String rateReview;

  ProgramModel({
    required this.code,
    required this.programName,
    required this.programYear,
    required this.startPrice,
    required this.imgPath,
    required this.rateReview,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      code: json['prog_Code'] ?? 0,
      programName: json['progName'] ?? '',
      programYear: json['prog_year'] ?? '',
      startPrice: json['StartPrice'] ?? 0,
      imgPath: json['IMG_Path'] ?? '',
      rateReview: json['Rate_Review'] ?? '',
    );
  }

  static fromJsonList(List list) => list.map((e) => ProgramModel.fromJson(e)).toList();
}
