import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';

class PolicyModel {
  final String policy;
  final String code;

  PolicyModel({
    required this.policy,
    required this.code,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) {
    return PolicyModel(
      policy: json['policy'] ?? (true ? 'No Policy specified' : 'لا يوجد سياسة'),
      code: json['code'] ?? (true ? 'No exclusions specified' : 'لا يوجد إستبعادات'),
    );
  }
}