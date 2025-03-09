import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor() : logger = Logger();

  late Logger logger;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    logger.i(
        'Request info: - base url: ${options.baseUrl} - path: ${options.path} - method: ${options.method} - headers: ${options.headers}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    logger.i(
        'Response info: - status code: ${response.statusCode} - headers: ${response.headers} - data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    logger.i(err.message);
    handler.next(err);
  }
}
