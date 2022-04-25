import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/user_repository.dart';
import 'package:ccalibre/domain/entities/repository.dart';
import 'package:dartz/dartz.dart';

/// Fetches all public repositories for given [githubUsername]
///
/// Required Params - [githubUsername].
/// Optional Params - [type], [sort], [direction], [perPage], [page].
class GetPublicRepos extends UseCase<List<Repository>, Params> {
  final UserRepository _repository;

  GetPublicRepos(this._repository);

  @override
  Future<Either<Failure, List<Repository>>> call(Params params) {
    return _repository.getPublicRepositories(
      params.githubUsername!,
      type: params.userParams.type,
      sort: params.userParams.sort,
      direction: params.userParams.direction,
      perPage: params.userParams.perPage,
      page: params.userParams.page,
    );
  }
}
