import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    List<String> publicEndpoints = ['/people'];

    Map<String, String> defaultHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    if (publicEndpoints.isNotEmpty) {
      if (!publicEndpoints.any((element) => options.path.startsWith(element))) {
        defaultHeaders['Authorization'] = 'Bearer my_token123';
      }
    }

    options.headers.addAll(defaultHeaders);
    handler.next(options);
  }
}
