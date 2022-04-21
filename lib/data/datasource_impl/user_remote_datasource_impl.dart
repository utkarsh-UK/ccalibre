import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/data/datasources/user_remote_datasource.dart';
import 'package:ccalibre/data/models/repository_model.dart';
import 'package:dio/dio.dart';

class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  final Dio _dio;

  UserRemoteDatasourceImpl(this._dio);

  @override
  Future<List<RepositoryModel>> getPublicRepositories(
    String username, {
    String type = 'all',
    String sort = 'created',
    String direction = 'desc',
    int perPage = 30,
    int page = 1,
  }) async {
    try {
      _dio.options = BaseOptions(baseUrl: 'https://api.github.com/users/');
      final queryParams = {
        'type': type,
        'sort': sort,
        'direction': 'direction',
        'per_page': perPage,
        'page': page,
      };

      final response = await Helpers.sendRequest(
        _dio,
        HttpRequestType.get,
        '$username/repos',
        queryParams: queryParams,
        isResponseListType: true,
      );

      return (response!['data'] as List<dynamic>)
          .map<RepositoryModel>((app) => RepositoryModel.fromJSON(app))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
