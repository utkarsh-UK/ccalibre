import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

/// Fetch build status for [buildID].
///
/// Required Params - [token], [buildID].
class GetBuildStatus extends UseCase<Build, Params> {
  final ApplicationRepository _repository;

  GetBuildStatus(this._repository);

  @override
  Future<Either<Failure, Build>> call(Params params) {
    return _repository.getBuildStatus(params.token!, buildID: params.buildID!);
  }
}
