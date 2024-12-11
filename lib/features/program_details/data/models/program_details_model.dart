class ProgramDetailsModel {
  final int progCode;
  final String programName;
  final String language;
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
    required this.language,
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
      programName: json['ProgramName'] ?? 'Unknown',
      language: json['language'] ?? 0,
      programYear: json['ProgramYear'] ?? 0,
      startPrice: json['StartPrice'] ?? 0,
      startDate: json['startDate'] ?? 'Unknown',
      endDate: json['endDate'] ?? 'Unknown',
      day: json['day'] ?? 0,
      classTrip: json['ClassTrip'] ?? 'Unknown',
      city: json['City'] ?? 'Unknown',
      overview: json['OverView'] ?? 'Unknown',
      tourIncluding: json['TOUR_INCLUDING'] ?? 'Unknown',
      tourExcluding: json['TOUREXCLUDING'] ?? 'Unknown',
    );
  }
}
