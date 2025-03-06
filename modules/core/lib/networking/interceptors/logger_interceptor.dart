import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor() : logger = Logger();

  late Logger logger;

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    logger.i(err.message);
    handler.next(err);
  }
}
