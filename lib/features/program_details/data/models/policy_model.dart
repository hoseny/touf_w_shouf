class PolicyModel {
  final String policy;
  final String code;

  PolicyModel({
    required this.policy,
    required this.code,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) {
    return PolicyModel(
      policy: json['policy'] ?? 'No Policy specified' ,
      code: json['code'] ?? 'No exclusions specified',
    );
  }
}