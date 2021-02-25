import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/data/network/base/dio_client.dart';
import 'package:provider_usecase_example/data/network/base/endpoints.dart';
import 'package:provider_usecase_example/data/network/service/github_service.dart';
import 'package:provider_usecase_example/di/provider/dio_provider.dart';

@module
abstract class NetworkModule {
  final String _TAG = "NetworkModule";

  @lazySingleton
  DioProvider get dioProvider => DioProvider();

  @singleton
  GithubService provideGithubService(DioProvider dioProvider) {
    DioClient dioClient =
        _provideDioClient(_provideNonAuthenticatedDio(dioProvider));
    return GithubServiceImpl(dioClient);
  }

  DioClient _provideDioClient(Dio dio) => DioClient(dio);

  Dio _provideNonAuthenticatedDio(DioProvider dioProvider) {
    return dioProvider.getDio(Endpoints.baseUrl, false);
  }
}
