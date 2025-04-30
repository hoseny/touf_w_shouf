import 'package:hive/hive.dart';

part 'program_model.g.dart';

@HiveType(typeId: 0)
class ProgramModel extends HiveObject {
  @HiveField(0)
  final int code;

  @HiveField(1)
  final String programName;

  @HiveField(2)
  final int programYear;

  @HiveField(3)
  final num startPrice;

  @HiveField(4)
  final String imgPath;

  @HiveField(5)
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
      code: json['prog_Code'] as int? ?? 0,
      programName: json['progName'] as String? ?? '',
      programYear: json['prog_year'] as int? ?? 0,
      startPrice: json['StartPrice'] as num? ?? 0,
      imgPath: json['IMG_Path'] as String? ?? '',
      rateReview: json['Rate_Review'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'prog_Code': code,
    'progName': programName,
    'prog_year': programYear,
    'StartPrice': startPrice,
    'IMG_Path': imgPath,
    'Rate_Review': rateReview,
  };

  static List<ProgramModel> fromJsonList(List list) {
    return list
        .map((e) => ProgramModel.fromJson((e as Map).cast<String, dynamic>()))
        .toList();
  }
}
