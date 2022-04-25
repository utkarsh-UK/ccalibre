import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

/// Fetch all applications for user.
/// 
/// Required Params - [token].
class GetAllApplications extends UseCase<List<Application>, Params> {
  final ApplicationRepository _repository;

  GetAllApplications(this._repository);

  @override
  Future<Either<Failure, List<Application>>> call(Params params) {
    return _repository.getAllApplications(params.token!);
  }
}
