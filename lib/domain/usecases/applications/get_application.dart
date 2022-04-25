import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

/// Fetch specific application details for [applicationID].
/// 
/// Required Params - [token], [applicationID].
class GetApplication extends UseCase<Application, Params> {
  final ApplicationRepository _repository;

  GetApplication(this._repository);

  @override
  Future<Either<Failure, Application>> call(Params params) {
    return _repository.getApplication(params.token!, params.applicationID!);
  }
}
