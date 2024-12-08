class ProgramModel {
  final int code;
  final String programname;
  final int programyear;
  final int languageCode;
  final num startprice;
  final String imgPath;
  final String rateReview;

  ProgramModel({
    required this.code,
    required this.programname,
    required this.programyear,
    required this.languageCode,
    required this.startprice,
    required this.imgPath,
    required this.rateReview,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      code: json['code'],
      programname: json['programname'],
      programyear: json['programyear'],
      languageCode: json['languagecode'],
      startprice: json['startprice'],
      imgPath: json['img_path'],
      rateReview: json['rate_review'],
    );
  }
}