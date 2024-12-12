class DetailsReservationRequest {
  final String custRef;
  final String telephone;
  final String progGrpNo;
  final String progCode;
  final int progYear;
  final String paxType;
  final int paxCount;

  DetailsReservationRequest({
    required this.custRef,
    required this.telephone,
    required this.progGrpNo,
    required this.progCode,
    required this.progYear,
    required this.paxType,
    required this.paxCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'CUST_REF': custRef,
      'TELEPHONE': telephone,
      'PROG_GRP_NO': progGrpNo,
      'PROG_CODE': progCode,
      'PROG_YEAR': progYear,
      'PAX_TYPE': paxType,
      'PAX_COUNT': paxCount,
    };
  }
}
