class ProgramGroup {
  final int progGrpNo;
  final DateTime progGrpFrom;
  final int paxAval;
  final String nationality;

  ProgramGroup({
    required this.progGrpNo,
    required this.progGrpFrom,
    required this.paxAval,
    required this.nationality,
  });

  factory ProgramGroup.fromJson(Map<String, dynamic> json) {
    return ProgramGroup(
      progGrpNo: json['prog_grp_no'],
      progGrpFrom: DateTime.parse(json['prog_grp_from']),
      paxAval: json['pax_aval'],
      nationality: json['nationaliy'],
    );
  }
}