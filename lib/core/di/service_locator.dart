import 'package:dio/dio.dart';
import 'package:geideapay/common/geidea.dart';
import 'package:geideapay/common/server_environments.dart';
import 'package:get_it/get_it.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo.dart';
import 'package:touf_w_shouf/features/auth/data/repos/auth_repo_impl.dart';
import 'package:touf_w_shouf/features/auth/presentation/manager/auth_cubit.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo_impl.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';

final getIt = GetIt.instance;

GeideapayPlugin _initializeGeideaPlugin() {
  final plugin = GeideapayPlugin();

  plugin.initialize(
    publicKey: '0c5da0b6-7be7-4f99-9d45-41cbb3a7d8a6',
    apiPassword: '84bd8f1b-caa6-458f-af6f-963fd9609668',
    serverEnvironment: ServerEnvironmentModel.EGY_PROD(),
  );
  return plugin;
}

Future<void> setupServiceLocator() async {
  // Register Dio instance
  getIt.registerSingleton<Dio>(DioFactory.dio);
  // Register API Service with the Dio instance
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));

  // Register Geidea plugin
  getIt.registerLazySingleton<GeideapayPlugin>(
    () => _initializeGeideaPlugin(),
  );
  // <---------------------------------------------------------------------------->
  // Features
  // Auth
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  // Auth Cubit
  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(
      getIt.get<AuthRepo>(),
    ),
  );
  // <---------------------------------------------------------------------------->
  // Home Repo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  // Home Cubit
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt.get<HomeRepo>(),
    ),
  );
  // <---------------------------------------------------------------------------->
  // Repositories

  getIt.registerLazySingleton<ProgramDetailsRepoImpl>(() => ProgramDetailsRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<PaymentRepoImpl>(() => PaymentRepoImpl(apiService: getIt.get<ApiService>()));
}
