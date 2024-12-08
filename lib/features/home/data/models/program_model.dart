class ProgramModel {
  final int code;
  final String programName;
  final int programYear;
  final int languageCode;
  final num startPrice;
  final String imgPath;
  final String rateReview;

  ProgramModel({
    required this.code,
    required this.programName,
    required this.programYear,
    required this.languageCode,
    required this.startPrice,
    required this.imgPath,
    required this.rateReview,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      code: json['code'],
      programName: json['programname'],
      programYear: json['programyear'],
      languageCode: json['languagecode'],
      startPrice: json['startprice']??0,
      imgPath: json['img_path'],
      rateReview: json['rate_review'],
    );
  }
}