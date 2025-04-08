class GroupPrice {
  final String paxType;
  final num pPrice;
  final int progGrpNo;
  int count;
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
      paxType: json['pax_type'],
      pPrice: json['p_price'],
      progGrpNo: json['prog_grp_no'],
      pCategory: json['p_category'],
    );
  }
}
