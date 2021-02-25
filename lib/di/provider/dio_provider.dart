import 'package:dio/dio.dart';

const String HEADER_CONTENT_TYPE = 'Content-Type';
const String DEFAULT_CONTENT_TYPE = 'application/json; charset=utf-8';

class DioProvider {
  Dio _nonAuthenticatedDio;

  DioProvider();

  Dio getDio(String baseUrl, bool isAuthentication) {
    if (isAuthentication) {
      // TODO: not yet implemented
      return _nonAuthenticatedDio;
    } else {
      if (_nonAuthenticatedDio == null) {
        final dio = Dio();
        final logInterceptor = LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        );
        final interceptors = List<Interceptor>();
        interceptors.add(logInterceptor);
        return dio
          ..options.baseUrl = baseUrl
          ..options.connectTimeout = 3000
          ..options.receiveTimeout = 5000
          ..options.headers = {HEADER_CONTENT_TYPE: DEFAULT_CONTENT_TYPE}
          ..interceptors.addAll(interceptors);
      }
      return _nonAuthenticatedDio;
    }
  }
}
