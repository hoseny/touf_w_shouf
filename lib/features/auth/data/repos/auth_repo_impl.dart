import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_request.dart';
import 'package:touf_w_shouf/features/auth/data/models/login_models/login_response.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponse>> loginRequest({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.login(loginRequest: loginRequest),
      );

      final loginResponse = LoginResponse.fromJson(response);

      final token = loginResponse.token ?? '';
      if (token.isNotEmpty) {
        await SharedPref.setData(
          key: SharedPrefKeys.token,
          value: token,
        );

        DioFactory.setTokenIntoHeaderAfterLogin(token);
      } else {
        return Left(ServerFailure('Token is missing or invalid'));
      }

      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
