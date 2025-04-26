import 'package:dio/dio.dart';

class DetailsReservationRequest {
  final List<Reservation> reservation;
  final List<Additional> additional;

  DetailsReservationRequest({
    required this.reservation,
    required this.additional,
  });

  /// Builds a FormData object ready for Dio requests
  Future<FormData> toFormData() async {
    final formDataMap = {
      'REQ_BODY': {
        'Reservation': reservation.map((r) => r.toJson()).toList(),
        'Additional': additional.map((a) => a.toJson()).toList(),
      },
    };

    return FormData.fromMap(formDataMap);
  }

  /// Converts this request to a plain JSON map
  Map<String, dynamic> toJson() {
    return {
      'Reservation': reservation.map((r) => r.toJson()).toList(),
      'Additional': additional.map((a) => a.toJson()).toList(),
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

class Additional {
  final String custRef;
  final String refNo;
  final int resSp;
  final String srvType;
  final String paxType;
  final int paxCount;
  final String itemRef;
  final String code;
  final int year;

  Additional({
    required this.custRef,
    required this.refNo,
    required this.resSp,
    required this.srvType,
    required this.paxType,
    required this.paxCount,
    required this.itemRef,
    required this.code,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'CUST_REF': custRef,
      'REF_NO': refNo,
      'RES_SP': resSp,
      'SRV_TYPE': srvType,
      'PAX_TYPE': paxType,
      'PAX_COUNT': paxCount,
      'ITEM_REF': itemRef,
      'CODE': code,
      'YEAR': year,
    };
  }
}
