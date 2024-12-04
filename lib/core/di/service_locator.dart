import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  //repos
}
