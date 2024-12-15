class DisplayPaymentModel {
  final int programCode;
  final String programName;
  final int programYear;
  final String tripDate;
  final int customerRef;
  final int reservationRef;
  final int reservationSp;
  final int numberOfAdults;
  final double totalWithoutAdditionalService;
  final double? totalAdditionalService;
  final double total;
  final double vat;
  final double totalIncludesVat;

  DisplayPaymentModel({
    required this.programCode,
    required this.programName,
    required this.programYear,
    required this.tripDate,
    required this.customerRef,
    required this.reservationRef,
    required this.reservationSp,
    required this.numberOfAdults,
    required this.totalWithoutAdditionalService,
    this.totalAdditionalService,
    required this.total,
    required this.vat,
    required this.totalIncludesVat,
  });

  factory DisplayPaymentModel.fromJson(Map<String, dynamic> json) {
    return DisplayPaymentModel(
      programCode: json['programCode'] ?? 0,
      programName: json['programname'] ?? '',
      programYear: json['programyear'] ?? 0,
      tripDate: json['TripDate :'] ?? '',
      customerRef: json['Customerref :'] ?? 0,
      reservationRef: json['reservationRef '] ?? 0,
      reservationSp: json['reservationsp'] ?? 0,
      numberOfAdults: json['TheNumberOfADULTX'] ?? 0,
      totalWithoutAdditionalService: json['TheTotalwithoutadditionalservice']?.toDouble() ?? 0.0,
      totalAdditionalService: json['TheTotaladditionalservice']?.toDouble(),
      total: json['Total ']?.toDouble() ?? 0.0,
      vat: json['Vat ']?.toDouble() ?? 0.0,
      totalIncludesVat: json['TheTotalincludesVat ']?.toDouble() ?? 0.0,
    );
  }
}
