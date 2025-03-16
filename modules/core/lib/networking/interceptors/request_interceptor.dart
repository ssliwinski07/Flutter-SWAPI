import 'package:dio/dio.dart';

import 'package:base_module/interfaces/service_interfaces.dart';

class RequestInterceptor extends Interceptor {
  RequestInterceptor(
      {required TokenProviderServiceInterface tokenProviderService})
      : _tokenProviderService = tokenProviderService;

  final TokenProviderServiceInterface _tokenProviderService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    List<String> publicEndpoints = ['/people12'];

    Map<String, String> defaultHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    if (publicEndpoints.isNotEmpty) {
      if (!publicEndpoints.any((element) => options.path.startsWith(element))) {
        // simulation of getting auth token from shared preferences (SWAPI has public endpoints, so token is not required)
        final token = _tokenProviderService.getToken(name: 'authToken');
        defaultHeaders['Authorization'] = 'Bearer $token';
      }
    }

    options.headers.addAll(defaultHeaders);
    handler.next(options);
  }
}
