import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class StartNewBuild extends UseCase<void, Params> {
  final ApplicationRepository _repository;

  StartNewBuild(this._repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _repository.startNewBuild(
      params.token!,
      applicationID: params.applicationID!,
      workflowID: params.workflowID!,
      branch: params.branch!,
      environment: params.buildEnvironments,
    );
  }
}
