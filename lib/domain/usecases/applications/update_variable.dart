import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

/// Update variable with [value].
/// 
/// Required Params - [token], [applicationID], [variableID], [value].
class UpdateVariable extends UseCase<void, Params> {
  final ApplicationRepository _repository;

  UpdateVariable(this._repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _repository.updateVariable(
      params.token!,
      applicationID: params.applicationID!,
      variableID: params.variableKey!,
      value: params.variableValue!,
    );
  }
}
