class ReservationResponse {
  final int refNo;
  final String progCode;
  final String progYear;
  final int resSp;
  final String grpNo;

  ReservationResponse({
    required this.refNo,
    required this.progCode,
    required this.progYear,
    required this.resSp,
    required this.grpNo,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      refNo: json['REF_NO'],
      progCode: json['PROGCODE'],
      progYear: json['PROGYEAR'],
      resSp: json['RESSP'],
      grpNo: json['GRPNO'],
    );
  }
}