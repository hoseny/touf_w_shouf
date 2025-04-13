import 'package:easy_localization/easy_localization.dart';

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

  static fromJsonList(List list) => list.map((e) => ProgramGroup.fromJson(e)).toList();

  String get formattedProgGrpFrom {
    return DateFormat('M/d/yyyy').format(progGrpFrom);
  }

  @override
  String toString() => formattedProgGrpFrom;
}
