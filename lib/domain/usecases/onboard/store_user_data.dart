import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/repositories/onboard_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ccalibre/core/utils/failure.dart';

/// Stores github username and token to local device.
///
/// Required Params - [tokenFile], [githubUsername].
class StoreUserData extends UseCase<User, Params> {
  final OnboardRepository _repository;

  StoreUserData(this._repository);

  @override
  Future<Either<Failure, User>> call(Params params) {
    return _repository.storeUserData(params.tokenFile!, params.githubUsername!);
  }
}
