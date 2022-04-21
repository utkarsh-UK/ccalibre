import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/data/datasources/user_remote_datasource.dart';
import 'package:ccalibre/domain/entities/repository.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource _remoteDatasource;

  UserRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Repository>>> getPublicRepositories(
    String username, {
    String type = 'all',
    String sort = 'created',
    String direction = 'desc',
    int perPage = 30,
    int page = 1,
  }) async {
    try {
      return Right(
        await _remoteDatasource.getPublicRepositories(
          username,
          type: type,
          sort: sort,
          direction: direction,
          perPage: perPage,
          page: page,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
