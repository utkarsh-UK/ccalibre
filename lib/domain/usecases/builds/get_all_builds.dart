import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllBuilds extends UseCase<List<Build>, Params> {
  final ApplicationRepository _repository;

  GetAllBuilds(this._repository);

  @override
  Future<Either<Failure, List<Build>>> call(Params params) {
    return _repository.getAllBuilds(params.token!);
  }
}
