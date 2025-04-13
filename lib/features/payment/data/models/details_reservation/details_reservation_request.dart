import 'package:dio/dio.dart';

class DetailsReservationRequest {
  final List<Reservation> reservation;

  DetailsReservationRequest({required this.reservation});

  Future<FormData> toFormData() async {
    final formDataMap = {
      'REQ_BODY': {
        'Reservation': reservation.map((r) => r.toJson()).toList(),
      },
    };

    return FormData.fromMap(formDataMap);
  }


  Map<String, dynamic> toJson() {
    return {
        'Reservation': reservation.map((r) => r.toJson()).toList(),
    };
  }
}

class Reservation {
  final String paxType;
  final int paxCount;
  final String ressp;
  final String refNo;
  final String custRef;
  final String code;
  final int year;
  final String progGrpNo;

  Reservation({
    required this.paxType,
    required this.paxCount,
    required this.ressp,
    required this.refNo,
    required this.custRef,
    required this.code,
    required this.year,
    required this.progGrpNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'PAX_TYPE': paxType,
      'PAX_COUNT': paxCount,
      'RESSP': ressp,
      'REF_NO': refNo,
      'CUST_REF': custRef,
      'CODE': code,
      'YEAR': year,
      'PROG_GRP_NO': progGrpNo,
    };
  }
}
