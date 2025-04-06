import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';

class ProgramDetailsModel {
  final int progCode;
  final String programName;
  final int programYear;
  final int startPrice;
  final String startDate;
  final String endDate;
  final int day;
  final String classTrip;
  final String city;
  final String overview;
  final String tourIncluding;
  final String tourExcluding;

  ProgramDetailsModel({
    required this.progCode,
    required this.programName,
    required this.programYear,
    required this.startPrice,
    required this.startDate,
    required this.endDate,
    required this.day,
    required this.classTrip,
    required this.city,
    required this.overview,
    required this.tourIncluding,
    required this.tourExcluding,
  });

  factory ProgramDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProgramDetailsModel(
      progCode: json['PROGCODE'] ?? 0,
      programName: json['ProgramName'] ?? (true ? 'Unknown' : 'غير معروف'),
      programYear: json['ProgramYear'] ?? 0,
      startPrice: json['StartPrice'] ?? 0,
      startDate: json['startDate'] ?? (true ? 'Unknown' : 'غير معروف'),
      endDate: json['endDate'] ?? (true ? 'Unknown' : 'غير معروف'),
      day: json['day'] ?? 0,
      classTrip: json['ClassTrip'] ?? (true ? 'Unknown' : 'غير معروف'),
      city: json['City'] ?? (true ? 'Unknown' : 'غير معروف'),
      overview: json['OverView'] ?? (true ? 'Unknown' : 'غير معروف'),
      tourIncluding: json['TOUR_INCLUDING'] ?? (true ? 'Unknown' : 'غير معروف'),
      tourExcluding: json['TOUREXCLUDING'] ?? (true ? 'Unknown' : 'غير معروف'),
    );
  }
}
