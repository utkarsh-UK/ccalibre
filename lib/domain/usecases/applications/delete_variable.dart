import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteVariable extends UseCase<bool, Params> {
  final ApplicationRepository _repository;

  DeleteVariable(this._repository);

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return _repository.deleteVariable(
      params.token!,
      applicationID: params.applicationID!,
      variableID: params.variableKey!,
    );
  }
}
