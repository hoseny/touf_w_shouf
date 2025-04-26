class ProgramDetailsModel {
  final int progCode;
  final String programName;
  final int programYear;
  final num startPrice;
  final String startDate;
  final String endDate;
  final int day;
  final String classTrip;
  final String city;
  final String overview;
  final String tourIncluding;
  final String tourExcluding;
  final String cancelPolicy;
  final String videoUrl;

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
    required this.cancelPolicy,
    required this.videoUrl,
  });

  factory ProgramDetailsModel.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List?)?.firstOrNull ?? {};
    final cancelPolicyList = (json['Cancel Policy'] as List?) ?? [];
    final videoList = (json['Vedio'] as List?) ?? [];

    // Extract the first video's Logo_PATH as URL, or empty string
    String extractVideoUrl() {
      if (videoList.isNotEmpty) {
        final firstVideo = videoList.first;
        final url = firstVideo['Logo_PATH'];
        if (url is String && url.isNotEmpty) {
          return url;
        }
      }
      return '';
    }

    return ProgramDetailsModel(
      progCode: items['PROGCODE'] ?? 0,
      programName: items['ProgramName'] ?? 'Unknown',
      programYear: items['ProgramYear'] ?? 0,
      startPrice: items['StartPrice'] ?? 0,
      startDate: items['startDate'] ?? 'Unknown',
      endDate: items['endDate'] ?? 'Unknown',
      day: items['day'] ?? 0,
      classTrip: items['ClassTrip'] ?? 'Unknown',
      city: items['City'] ?? 'Unknown',
      overview: items['OverView'] ?? 'Unknown',
      tourIncluding: items['TOUR_INCLUDING'] ?? 'Unknown',
      tourExcluding: items['TOUREXCLUDING'] ?? 'Unknown',
      cancelPolicy: cancelPolicyList.isNotEmpty
          ? (cancelPolicyList.first['policy'] ?? 'No Policy')
          : 'No Policy',
      videoUrl: extractVideoUrl(),
    );
  }
}

// Helper extension to avoid crash if items list is empty
extension FirstOrNullExtension<E> on List<E> {
  E? get firstOrNull => isNotEmpty ? first : null;
}
