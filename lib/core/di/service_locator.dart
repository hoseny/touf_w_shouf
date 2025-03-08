import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo_impl.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo_impl.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Dio instance
  getIt.registerSingleton<Dio>(DioFactory.dio);
  // Register API Service with the Dio instance
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  //repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProgramDetailsRepoImpl>(ProgramDetailsRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<PaymentRepoImpl>(PaymentRepoImpl(apiService: getIt.get<ApiService>()));
}
