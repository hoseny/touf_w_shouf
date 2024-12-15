class DetailsReservationRequest {
  final String ressp;
  final String refNo;
  final String custRef;
  final String programCode;
  final String programYear;
  final String paxType;
  final String paxCount;
  final String progGrpNo;

  DetailsReservationRequest({
    required this.ressp,
    required this.refNo,
    required this.custRef,
    required this.programCode,
    required this.programYear,
    required this.paxType,
    required this.paxCount,
    required this.progGrpNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'RESSP': ressp,
      'REF_NO': refNo,
      'CUST_REF': custRef,
      'CODE': programCode,
      'YEAR': programYear,
      'PAX_TYPE': paxType,
      'PAX_COUNT': paxCount,
      'PROG_GRP_NO': progGrpNo
    };
  }
}
