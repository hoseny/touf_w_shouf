class ServicesModel {
  final List<GroupPrice> groupPrice;
  final List<AdditionalService> additionalServices;

  ServicesModel({
    required this.groupPrice,
    required this.additionalServices,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      groupPrice: (json['items'] as List<dynamic>?)
          ?.map((e) => GroupPrice.fromJson(e))
          .toList() ?? [],
      additionalServices: (json['Addtional services'] as List<dynamic>?)
          ?.map((e) => AdditionalService.fromJson(e))
          .toList() ?? [],
    );
  }

  /// Creates a copy of this ServicesModel with optionally updated lists.
  ServicesModel copyWith({
    List<GroupPrice>? groupPrice,
    List<AdditionalService>? additionalServices,
  }) {
    return ServicesModel(
      groupPrice: groupPrice ?? this.groupPrice,
      additionalServices: additionalServices ?? this.additionalServices,
    );
  }
}

class GroupPrice {
  final String paxType;
  final num pPrice;
  final int progGrpNo;
  final int count;
  final String pCategory;

  GroupPrice({
    required this.paxType,
    required this.pPrice,
    required this.progGrpNo,
    required this.pCategory,
    this.count = 0,
  });

  factory GroupPrice.fromJson(Map<String, dynamic> json) {
    return GroupPrice(
      paxType: json['pax_type'] ?? 'Unknown',
      pPrice: json['p_price'] ?? 0,
      progGrpNo: json['prog_grp_no'] ?? 0,
      pCategory: json['p_category'] ?? 'Unknown',
    );
  }

  GroupPrice copyWith({
    String? paxType,
    num? pPrice,
    int? progGrpNo,
    int? count,
    String? pCategory,
  }) {
    return GroupPrice(
      paxType: paxType ?? this.paxType,
      pPrice: pPrice ?? this.pPrice,
      progGrpNo: progGrpNo ?? this.progGrpNo,
      count: count ?? this.count,
      pCategory: pCategory ?? this.pCategory,
    );
  }
}

class AdditionalService {
  final int extSp;
  final String extSrv;
  final String extDescr;
  final String categoryName;
  final String pCategory;
  final num extPrice;
  final int progCode;
  final int progYear;
  final String itemRef;
  final int count;

  AdditionalService({
    required this.extSp,
    required this.extSrv,
    required this.extDescr,
    required this.categoryName,
    required this.pCategory,
    required this.extPrice,
    required this.progCode,
    required this.progYear,
    required this.itemRef,
    this.count = 0,
  });

  factory AdditionalService.fromJson(Map<String, dynamic> json) {
    return AdditionalService(
      extSp: json['ext_sp'] ?? 0,
      extSrv: json['ext_srv'] ?? 'Unknown',
      extDescr: json['ext_descr'] ?? 'Unknown',
      categoryName: json['category_name'] ?? 'Unknown',
      pCategory: json['p_category'] ?? 'Unknown',
      extPrice: json['ext_price'] ?? 0,
      progCode: json['prog_code'] ?? 0,
      progYear: json['prog_year'] ?? 0,
      itemRef: json['item_ref'] ?? 'Unknown',
    );
  }

  AdditionalService copyWith({
    int? extSp,
    String? extSrv,
    String? extDescr,
    String? categoryName,
    String? pCategory,
    num? extPrice,
    int? progCode,
    int? progYear,
    String? itemRef,
    int? count,
  }) {
    return AdditionalService(
      extSp: extSp ?? this.extSp,
      extSrv: extSrv ?? this.extSrv,
      extDescr: extDescr ?? this.extDescr,
      categoryName: categoryName ?? this.categoryName,
      pCategory: pCategory ?? this.pCategory,
      extPrice: extPrice ?? this.extPrice,
      progCode: progCode ?? this.progCode,
      progYear: progYear ?? this.progYear,
      itemRef: itemRef ?? this.itemRef,
      count: count ?? this.count,
    );
  }
}
