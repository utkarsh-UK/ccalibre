import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class CancelBuild extends UseCase<void, Params> {
  final ApplicationRepository _repository;

  CancelBuild(this._repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _repository.cancelBuild(params.token!, buildID: params.buildID!);
  }
}
