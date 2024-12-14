class ReservationRequest {
  final String custRef;
  final String telephone;
  final String progGrpNo;
  final String progCode;
  final String progYear;
  final String lang;

  ReservationRequest({
    required this.custRef,
    required this.telephone,
    required this.progGrpNo,
    required this.progCode,
    required this.progYear,
    required this.lang,
  });

  Map<String, dynamic> toJson() {
    return {
      'CUST_REF': custRef,
      'TELEPHONE': telephone,
      'PROG_GRP_NO': progGrpNo,
      'PROG__CODE': progCode,
      'PROG_YEAR': progYear,
      'lang': lang,
    };
  }
}
