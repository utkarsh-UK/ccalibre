import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/repositories/onboard_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ccalibre/core/utils/failure.dart';

class GetUserData extends UseCase<User?, NoParams> {
  final OnboardRepository _repository;

  GetUserData(this._repository);

  @override
  Future<Either<Failure, User?>> call(NoParams params) {
    return _repository.getUserData();
  }
}
