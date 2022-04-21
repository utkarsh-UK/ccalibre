import 'package:ccalibre/data/models/repository_model.dart';

abstract class UserRemoteDatasource {
  Future<List<RepositoryModel>> getPublicRepositories(String username, {
    String type = 'all',
    String sort = 'created',
    String direction = 'desc',
    int perPage = 30,
    int page = 1,
  });
}
