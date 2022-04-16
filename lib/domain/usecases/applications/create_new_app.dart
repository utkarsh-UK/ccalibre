import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class CreateNewApplication extends UseCase<void, Params> {
  final ApplicationRepository _repository;

  CreateNewApplication(this._repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _repository.getAllApplications(params.token!);
  }
}
