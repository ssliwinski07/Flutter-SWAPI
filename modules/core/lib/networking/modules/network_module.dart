import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:base_module/interfaces/service_interfaces.dart';

import '../interceptors/logger_interceptor.dart';
import '../interceptors/request_interceptor.dart';

@module
@Singleton()
abstract class NetworkModule {
  @Named('swapi')
  Dio dio(SharedPreferencesServiceInterface sharedPreferencesService) =>
      Dio(BaseOptions(
        baseUrl: 'https://swapi.dev/api',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ))
        ..interceptors.addAll([
          RequestInterceptor(
              sharedPreferencesService: sharedPreferencesService),
          LoggerInterceptor()
        ]);
}
