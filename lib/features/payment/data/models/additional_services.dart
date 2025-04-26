class AdditionalServices {
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

  AdditionalServices({
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

  factory AdditionalServices.fromJson(Map<String, dynamic> json) {
    return AdditionalServices(
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
}
