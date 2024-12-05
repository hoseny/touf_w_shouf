import 'package:dio/dio.dart';

class SignUpRequest {
  final String phone;
  final String email;
  final String userName;
  final String password;
  final String nat;
  final String address;

  SignUpRequest({
    required this.phone,
    required this.email,
    required this.userName,
    required this.password,
    required this.nat,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'CNAME': userName,
      'NAT': nat,
      'TEL': phone,
      'C_PASS': password,
      'p_Mail': email,
      'C_ADDRESS': address
    };
  }
}
