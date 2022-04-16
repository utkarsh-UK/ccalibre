import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class AddVariable extends UseCase<void, Params> {
  final ApplicationRepository _repository;

  AddVariable(this._repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _repository.addVariable(
      params.token!,
      applicationID: params.applicationID!,
      workflowID: params.workflowID!,
      key: params.variableKey!,
      value: params.variableValue!,
    );
  }
}
