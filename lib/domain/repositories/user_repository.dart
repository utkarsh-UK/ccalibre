import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/repository.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<Repository>>> getPublicRepositories(String username, {
    String type = 'all',
    String sort = 'created',
    String direction = 'desc',
    int perPage = 30,
    int page = 1,
  });
}
