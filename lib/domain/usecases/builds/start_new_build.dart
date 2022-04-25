import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

/// Starts new build.
///
/// Required Params - [token], [applicationID], [workflowID], [branch]
/// Optional Params - [environment].
class StartNewBuild extends UseCase<String, Params> {
  final ApplicationRepository _repository;

  StartNewBuild(this._repository);

  @override
  Future<Either<Failure, String>> call(Params params) {
    return _repository.startNewBuild(
      params.token!,
      applicationID: params.applicationID!,
      workflowID: params.workflowID!,
      branch: params.branch!,
      environment: params.buildEnvironments,
    );
  }
}
