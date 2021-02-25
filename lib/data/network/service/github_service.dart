import 'package:provider_usecase_example/data/network/base/dio_client.dart';

abstract class GithubService {}

class GithubServiceImpl extends GithubService {
  final DioClient _dioClient;

  GithubServiceImpl(this._dioClient);
}
