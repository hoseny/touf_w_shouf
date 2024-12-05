import 'package:dartz/dartz.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_response.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/signup_models/signup_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginRequest loginRequest});

  Future<Either<Failure, SignUpResponse>> signUpRequest(
      {required SignUpRequest signUpRequest});

}