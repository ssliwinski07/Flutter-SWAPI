import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../interceptors/logger_interceptor.dart';
import '../interceptors/request_interceptor.dart';

@module
@Singleton()
abstract class NetworkModule {
  @Named('swapi')
  Dio get dio => Dio(BaseOptions(
        baseUrl: 'https://swapi.dev/api',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ))
        ..interceptors.addAll([RequestInterceptor(), LoggerInterceptor()]);
}
