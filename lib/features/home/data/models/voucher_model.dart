class Voucher {
  final String logoPath;
  final int voucherNo;
  final String issueDate;
  final String customerName;
  final String phone;
  final String email;
  final int adultNo;
  final String serviceType;
  final String city;
  final String country;
  final DateTime dateStart;
  final DateTime dateEnd;
  final int nightCount;
  final int bookingReference;
  final List<IncludedService> includedService;
  final List<Provider> providers;

  Voucher({
    required this.logoPath,
    required this.voucherNo,
    required this.issueDate,
    required this.customerName,
    required this.phone,
    required this.email,
    required this.adultNo,
    required this.serviceType,
    required this.city,
    required this.country,
    required this.dateStart,
    required this.dateEnd,
    required this.nightCount,
    required this.bookingReference,
    required this.includedService,
    required this.providers,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      logoPath: json['LogoPath'] ?? '',
      voucherNo: json['VoucherNo'] ?? 0,
      issueDate: json['IssueDate'] ?? '',
      customerName: json['CustomerName'] ?? '',
      phone: json['Phone'] ?? '',
      email: json['EMail'] ?? '',
      adultNo: json['AdultNo'] ?? 0,
      serviceType: json['ServiceType'] ?? '',
      city: json['City'] ?? '',
      country: json['Country'] ?? '',
      dateStart: DateTime.parse(json['DateStart']),
      dateEnd: DateTime.parse(json['DateEnd']),
      nightCount: json['NightCount'] ?? 0,
      bookingReference: json['BookingReference'] ?? 0,
      includedService: (json['INCLUDEDSERVICE'] as List<dynamic>)
          .map((e) => IncludedService.fromJson(e))
          .toList(),
      providers: (json['Providers'] as List<dynamic>)
          .map((e) => Provider.fromJson(e))
          .toList(),
    );
  }
}

class IncludedService {
  final String? hotel;
  final String? sightseeing;
  final String? transport;

  IncludedService({this.hotel, this.sightseeing, this.transport});

  factory IncludedService.fromJson(Map<String, dynamic> json) {
    return IncludedService(
      hotel: json['Hotel '] ?? '',
      sightseeing: json['siteseeing '] ?? '',
      transport: json['Transport '] ?? '',
    );
  }
}

class Provider {
  final String providerName;
  final String providerPhone;
  final String providerEmail;

  Provider({
    required this.providerName,
    required this.providerPhone,
    required this.providerEmail,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      providerName: json['ProviderName'] ?? '',
      providerPhone: json['ProviderPhone'] ?? '',
      providerEmail: json['ProviderEmail'] ?? '',
    );
  }
}
