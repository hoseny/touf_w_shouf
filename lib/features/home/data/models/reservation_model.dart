class ReservationModel {
  final int reservationNo;
  final String reservationReferrance;
  final int progYear;
  final int programCode;
  final int groupCode;
  final DateTime dateTrip;
  final String programName;
  final int customerID;
  final String customerName;
  final double totalPayMent;
  final String currany;
  final String payMentStatus;
  final String paymentMethod;
  final int referrancePayment;
  final String transactionReferrance;
  final String imgPath;

  ReservationModel({
    required this.reservationNo,
    required this.reservationReferrance,
    required this.progYear,
    required this.programCode,
    required this.groupCode,
    required this.dateTrip,
    required this.programName,
    required this.customerID,
    required this.customerName,
    required this.totalPayMent,
    required this.currany,
    required this.payMentStatus,
    required this.paymentMethod,
    required this.referrancePayment,
    required this.transactionReferrance,
    required this.imgPath,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationNo: json['ReservationNo'] ?? 0,
      reservationReferrance: json['ReservationReferrance'] ?? '',
      progYear: json['PROG_YEAR'] ?? 0,
      programCode: json['ProgramCode'] ?? 0,
      groupCode: json['GroupCode'] ?? 0,
      dateTrip: json['DateTrip'] != null
          ? DateTime.parse(json['DateTrip'])
          : DateTime(2000, 1, 1),
      programName: json['ProgramName'] ?? '',
      customerID: json['CustomerID'] ?? 0,
      customerName: json['CustomerName'] ?? '',
      totalPayMent: (json['TotalPayMent'] as num?)?.toDouble() ?? 0.0,
      currany: json['Currany'] ?? '',
      payMentStatus: json['PayMentStatus'] ?? '',
      paymentMethod: json['PAYMENTMETHOD'] ?? '',
      referrancePayment: json['ReferrancePayment'] ?? 0,
      transactionReferrance: json['TransactionReferrance'] ?? '',
      imgPath: json['IMG_Path'] ?? '',
    );
  }

  static fromJsonList(List list) => list.map((e) => ReservationModel.fromJson(e)).toList();
}
